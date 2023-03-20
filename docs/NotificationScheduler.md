# ![](../godot-addons/notification_scheduler/icon.png?raw=true) Notification Scheduler Plugin

NotificationScheduler plugin allows scheduling of local mobile notifications

## ![](../godot-addons/notification_scheduler/icon.png?raw=true) Prerequisite
Follow instructions on the following page to create a custom Android build
- [Create custom Android build](https://docs.godotengine.org/en/stable/tutorials/export/android_custom_build.html)

## ![](../godot-addons/notification_scheduler/icon.png?raw=true) Installation
NotificationScheduler plugin consists of two parts
- Android plugin
- Godot addon

### ![](../godot-addons/notification_scheduler/icon.png?raw=true) Installing the Android plugin
Copy the following files from the release archive
- `NotificationScheduler.gdap`
- `NotificationScheduler-*-release.aar`

to the `android/plugins` directory

### ![](../godot-addons/notification_scheduler/icon.png?raw=true) Installing the Godot addon
Copy the following files from the release archive
- `NotificationScheduler.gd`
- `NotificationSchedulerPlugin.gd`
- `icon.png`
- `plugin.cfg`

to the `addons/notification_scheduler` directory

## ![](../godot-addons/notification_scheduler/icon.png?raw=true) Troubleshooting
`adb logcat` is one of the best tools for troubleshooting unexpected behavior
- use `$> adb logcat | grep 'godot'` on Linux
	- `adb logcat *:W` to see warnings and errors
	- `adb logcat *:E` to see only errors
	- `adb logcat | grep 'godot|somethingElse'` to filter using more than one string at the same time
- use `#> adb.exe logcat | select-string "godot"` on powershell (Windows)

Also check out:
https://docs.godotengine.org/en/stable/tutorials/platform/android/android_plugin.html#troubleshooting
