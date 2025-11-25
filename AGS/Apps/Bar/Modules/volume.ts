import app from "ags/gtk4/app"
import { Astal, Gtk } from "ags/gtk4"
import { createPoll } from "ags/time"
import { monitorFile } from "ags/file"
import { exec } from "ags/process"
import GLib from "gi://GLib"
import AstalWp from "gi://AstalWp"

const SINK = AstalWp.get_default().get_default_speaker();

