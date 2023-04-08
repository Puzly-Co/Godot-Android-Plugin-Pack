# Godot-Android-Plugin-Pack
Contains the following Godot plugins for the Android OS.

- [Admob](docs/Admob.md)
- [Deeplink](docs/Deeplink.md)
- [In-app Review](docs/InappReview.md)
- [Notification Scheduler](docs/NotificationScheduler.md)
- [Share](docs/Share.md)

## Supported Godot Version
The plugins have been tested with Godot version 3.5.2

## ![](../godot-addons/notification_scheduler/icon.png?raw=true) Troubleshooting
`adb logcat` is one of the best tools for troubleshooting unexpected behavior
- use `$> adb logcat | grep 'godot'` on Linux
	- `adb logcat *:W` to see warnings and errors
	- `adb logcat *:E` to see only errors
	- `adb logcat | grep 'godot|somethingElse'` to filter using more than one string at the same time
- use `#> adb.exe logcat | select-string "godot"` on powershell (Windows)

Also check out:
https://docs.godotengine.org/en/stable/tutorials/platform/android/android_plugin.html#troubleshooting