#!/usr/bin/env -S ags run

import app from "ags/gtk4/app"
import { Astal, Gtk } from "ags/gtk4"
import { createPoll } from "ags/time"
import { monitorFile } from "ags/file"
import { exec } from "ags/process"
import GLib from "gi://GLib"

const configDir = GLib.getenv('SETTINGS_DIR') + '/AGS/Widgets/Bar/'
const stylesDir = configDir + '/Scss/'

monitorFile(
    // directory that contains the scss files
    stylesDir,

    // reload function
    function( ) {
        // main scss file
        const scss = stylesDir + `/index.scss`;

        // target css file
        const css = `/tmp/ags-style.css`;

        // compile, reset, apply
		exec(`bash -c 'sassc --style compact ${scss} ${css}'`);
        app.reset_css();
        app.apply_css(css, true);
    },
);

app.start({
	css: "/tmp/ags-style.css",
	main() {
		const { TOP, LEFT, RIGHT } = Astal.WindowAnchor
		const clock = createPoll("", 1000, "date")

		return (
			<window class="bar"
				visible
				anchor={Astal.WindowAnchor.TOP | Astal.WindowAnchor.LEFT | Astal.WindowAnchor.RIGHT}
			>
				<centerbox>
					<box class="module left" $type="start">

					</box>

					<box class="module center" $type="center">

					</box>

					<box class="module right" $type="end">
						<label
							label="hello"
						/>
					</box>
				</centerbox>
			</window>
		)
	},
})