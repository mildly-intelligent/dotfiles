#!/bin/python3

import json
from datetime import date, time, datetime

def between(n:int, low:int, hi:int) -> bool:
	return (n >= low) and (n < hi)

with open("/home/aurora/Settings/Misc/schoolSchedule.jsonc", 'r') as f:
	schedule = json.load(f)

now = datetime.now()

dayOfWeek = date.weekday(now)+1
timestamp = now.hour*60 + now.minute	# Key for the block schedule
datestamp = int(now.strftime("%j"))			# Key for the year schedule


if schedule["blockSchedule"][datestamp-288] != "":
	blocks:dict = schedule["daily"][str(dayOfWeek)]
else:
	print("\{\}")
	exit()


times = list(blocks.keys())
for i in range(len(times)-1):
	if between(timestamp, int(times[i]), int(times[i+1])):
		currentBlock = blocks[str(times[i])]
		if currentBlock in ("1","2","3"):
			currentBlock = schedule["blockSchedule"][datestamp-288][int(currentBlock)-1]
		nextBlockStart = datetime(now.year, now.month, now.day, int(times[i+1]) // 60, int(times[i+1]) % 60)

remainingTime = (nextBlockStart - now).seconds
hours = remainingTime // 3600
hoursFormatted = f"{hours} hours " if hours > 1 else "1 hour " if hours == 1 else ""
minutes = round((remainingTime - (hours*3600)) / 60)
minutesFormatted = f"{minutes} minutes " if minutes > 1 else "1 minute " if minutes == 1 else "zero minutes "


block:str = schedule["blocks"][currentBlock]



blockNameP1 = block.split(" | ")[0]
blockNameP2 = block.split(" | ")[-1]

output = {
	"text": blockNameP1,
	"tooltip": f"{f"{blockNameP2}\n" if blockNameP1 != blockNameP2 else ""}{hoursFormatted}{"and " if (hours>=1) and (minutes>=1) else ""}{minutesFormatted}remaining"
}

print(json.dumps(output))