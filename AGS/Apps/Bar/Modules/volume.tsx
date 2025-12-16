import AstalWp from "gi://AstalWp"
import { With, Accessor, createBinding } from "ags"

const SINK = AstalWp.get_default().get_default_speaker()

function __volumeIcon( vol:number ): string {
	if (SINK.mute) {
		return " "
	} else if (vol <= 0.2) {
		return " "
	} else if (vol <= 0.6) {
		return " "
	} else if (vol <= 1.0) {
		return " "
	} else if (vol <= 2.0) {
		return ""
	} else {
		return " "
	}
}

export function Volume( ) {
	var volume = createBinding(SINK, "volume").as(
		(vol) => `${__volumeIcon(vol)}${Math.floor(vol * 100)}%`
	)
	var mute = createBinding(SINK, "mute")

	return (
		<box class="module volume">
			<label class='text'
				label={volume && mute}
			/>
		</box>
	)
}