# ![](../godot-addons/deeplink/icon.png?raw=true) Deeplink Plugin

Deeplink plugin allows processing of application links that enable direct navigation to requested app content

## ![](../godot-addons/deeplink/icon.png?raw=true) Prerequisites
Follow instructions on the following page to create a custom Android build
- [Create custom Android build](https://docs.godotengine.org/en/stable/tutorials/export/android_custom_build.html)

Upgrade your target Android SDK version to 33 via `Project->Export...->Android->Target SDK`

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
Unzip the `deeplink-addon.zip` file inside the `addons/` directory

Then, enable the Godot Deeplink addon via `Project->Project Settings...->Plugins` in the Godot Editor

## ![](../godot-addons/deeplink/icon.png?raw=true) Usage
Add a `Deeplink` node to your scene and follow the following steps:
- register a listener for the `deeplink_received` signal
- use the following methods to get deeplink data:
    - `get_link_url()` -> full URL for the deeplink
	- `get_link_scheme()` -> scheme for the deeplink (ie. 'https')
	- `get_link_host()` -> host for the deeplink (ie. 'www.example.com')
	- `get_link_path()` -> path for the deeplink (the part that comes after host)

## ![](../godot-addons/deeplink/icon.png?raw=true) Troubleshooting
`adb logcat` is one of the best tools for troubleshooting unexpected behavior
- use `$> adb logcat | grep 'godot'` on Linux
	- `adb logcat *:W` to see warnings and errors
	- `adb logcat *:E` to see only errors
	- `adb logcat | grep 'godot|somethingElse'` to filter using more than one string at the same time
- use `#> adb.exe logcat | select-string "godot"` on powershell (Windows)

Also check out:
https://docs.godotengine.org/en/stable/tutorials/platform/android/android_plugin.html#troubleshooting
