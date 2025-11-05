#!/bin/bash

json="{\"\$schema\":\"/home/aurora/Settings/Misc/schema.event.json\","

d=""
e="00:00"
E="01/01"
l=""
r="never"
s="00:00"
S="01/01"
w="5"

while getopts "d:e:E:il:nNr:s:S:w:" opt; do
	case "${opt}" in
		d)
			d=${OPTARG}
			json+="\"description\":\"$d\","
			;;
		e)
			e=${OPTARG}
			if ! [[ "$e" =~ ^[0-2]?[0-9]:[0-5][0-9][[:space:]]*([ap]m|[AP]M)?$ ]]; then
				echo 'The argument `endtime` was not formatted correctly!' >/dev/stderr
				continue
			fi
			e=$(date -d"$e" '+%H:%M')
			json+="\"endtime\":\"$e\","
			;;
		E)
			E=${OPTARG}
			if ! [[ "$E" =~ ^[0-3]?[0-9][[:space:]]*\\/[[:space:]]*[01]?[0-9]$ ]]; then
				echo 'The argument `enddate` was not formatted correctly!' >/dev/stderr
				echo bad
				continue
			fi
			E=$(date -d"$E" '+%m/%d')
			json+="\"enddate\":\"$E\","
			;;
		i)
			i=${OPTARG}
			echo not available yet
		;;
		l)
			l=${OPTARG}
			json+="\"location\":\"$l\","
			;;
		n)
			json+="\"notify\":true,"
		;;
		N)
			json+="\"notify\":false,"
		;;
		r)
			r=${OPTARG}
			if ! [[ "$r" =~ ^never|daily|weekly|monthly|yearly|weekdays|weekends|mondays|tuesdays|wednesdays|thursdays|fridays|saturdays|sundays$ ]]; then
				echo 'The argument `repeat` was not formatted correctly!' >/dev/stderr
				echo bad
				continue
			fi
			json+="\"repeat\":\"$r\","
			;;
		s)
			s=${OPTARG}
			if ! [[ "$s" =~ ^[0-2]?[0-9]:[0-5][0-9][[:space:]]*([ap]m|[AP]M)?$ ]]; then
				echo 'The argument `starttime` was not formatted correctly!' >/dev/stderr
				echo bad
				continue
			fi
			s=$(date -d"$s" '+%H:%M')
			json+="\"starttime\":\"$s\","
			;;
		S)
			S=${OPTARG}
			if ! [[ "$S" =~ ^[0-3]?[0-9][[:space:]]*\/[[:space:]]*[01]?[0-9]$ ]]; then
				echo 'The argument `startdate` was not formatted correctly!' >/dev/stderr
				continue
			fi
			S=$(date -d"$S" '+%m/%d')
			json+="\"startdate\":\"$S\","
			;;
		w)
			w=$(echo ${OPTARG} | xargs)
			if ! [[ "$w" =~ ^\[?([0-9]+[[:space:]]?,[[:space:]]?)*([0-9]+[[:space:]]?)\]?$ ]]; then
				echo 'The argument `warning` was not formatted correctly!' >/dev/stderr
				continue
			fi
			w=$(echo "$w" | jq 2>/dev/null && echo "$w" || echo "[$w]")
			json+="\"warning\":$w,"
			;;
	esac
done

if [[ ! (-v s || -v S) ]]; then
	echo "One of \`-s\` and \`-S\` must be used!" >/dev/stderr
	exit
fi

name="${@:$OPTIND:1}"
name=$(echo $name | xargs)
json+="\"name\":\"$name\","
json="${json:0: -1}}"

filename="/home/aurora/Events/"
filename+=$(echo $name | awk -F '[^[:alnum:]]+' -v OFS=- '{$0=tolower($0); $1=$1} 1' || echo "unnamed")
filename+=".event.json"

echo $json | jq -SM > $filename

warnings="0 $(echo $w | jq -crM '.[]')"

echo "" > /tmp/crontabCalenderEvents

set -f
start=$(date -d"$s $S" '+%H %M %m %d')
i=0
for warning in $warnings; do
	t=$(date -d"$s $S - $warning minutes" '+%H %M %m %d')
	cron="${t:3:2} ${t:0:2} "

	case "$r" in
		never)		cron+="${t:3:2} ${t:0:2} *";;
		daily)		cron+="*        ${t:0:2} 0";;
		weekly)		cron+="*        *        $(date -d"$S" '+%w')";;
		monthly)	cron+="${t:3:2} *        *";;
		yearly)		cron+="${t:3:2} ${t:0:2} *";;
		weekdays)	cron+="${t:3:2} ${t:0:2} 1-5";;
		weekends)	cron+="${t:3:2} ${t:0:2} 0,6";;
		monday)		cron+="${t:3:2} ${t:0:2} MON";;
		tuesday)	cron+="${t:3:2} ${t:0:2} TUE";;
		wednesday)	cron+="${t:3:2} ${t:0:2} WED";;
		thursday)	cron+="${t:3:2} ${t:0:2} THU";;
		friday)		cron+="${t:3:2} ${t:0:2} FRI";;
		saturday)	cron+="${t:3:2} ${t:0:2} SAT";;
		sunday)		cron+="${t:3:2} ${t:0:2} SUN";;
	esac
	cron+=" /home/aurora/Settings/Scripts/notify-event.sh $filename $i"
	echo -e $cron >> /tmp/crontabCalenderEvents

	i=$(( $i + 1 ))
done
crontab -T /tmp/crontabCalenderEvents
echo -n "# $name - $filename" >> /var/spool/cron/aurora
cat /tmp/crontabCalenderEvents >> /var/spool/cron/aurora