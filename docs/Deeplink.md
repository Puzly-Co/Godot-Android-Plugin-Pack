# ![](../godot-addons/deeplink/icon.png?raw=true) Deeplink Plugin

Deeplink plugin allows processing of application links that enable direct navigation to requested app content

## ![](../godot-addons/deeplink/icon.png?raw=true) Prerequisite
Follow instructions on the following page to create a custom Android build
- [Create custom Android build](https://docs.godotengine.org/en/stable/tutorials/export/android_custom_build.html)

## ![](../godot-addons/deeplink/icon.png?raw=true) Installation
Deeplink plugin consists of two parts
- Android plugin
- Godot addon

### ![](../godot-addons/deeplink/icon.png?raw=true) Installing the Android plugin
Copy the following files from the release archive
- `Deeplink.gdap`
- `Deeplink-*-release.aar`

to the `android/plugins` directory

Then, enable the Godot Deeplink plugin via `Project->Export...->Android` in the Godot Editor

### ![](../godot-addons/deeplink/icon.png?raw=true) Installing the Godot addon
Copy the following files from the release archive
- `Deeplink.gd`
- `DeeplinkPlugin.gd`
- `icon.png`
- `plugin.cfg`

to the `addons/deeplink` directory

Then, enable the Godot Deeplink addon via `Project->Project Settings...->Plugins` in the Godot Editor

## ![](../godot-addons/deeplink/icon.png?raw=true) Troubleshooting
`adb logcat` is one of the best tools for troubleshooting unexpected behavior
- use `$> adb logcat | grep 'godot'` on Linux
	- `adb logcat *:W` to see warnings and errors
	- `adb logcat *:E` to see only errors
	- `adb logcat | grep 'godot|somethingElse'` to filter using more than one string at the same time
- use `#> adb.exe logcat | select-string "godot"` on powershell (Windows)

Also check out:
https://docs.godotengine.org/en/stable/tutorials/platform/android/android_plugin.html#troubleshooting
