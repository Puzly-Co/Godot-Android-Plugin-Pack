# ![](../godot-addons/share/icon.png?raw=true) Share Plugin

Share plugin allows sharing of text and images

_Based on Shin-NiL's [Godot Share plugin](https://github.com/Shin-NiL/Godot-Android-Share-Plugin)_

## ![](../godot-addons/share/icon.png?raw=true) Prerequisites
Follow instructions on the following page to create a custom Android build
- [Create custom Android build](https://docs.godotengine.org/en/stable/tutorials/export/android_custom_build.html)

Upgrade your target Android SDK version to 33 via `Project->Export...->Android->Target SDK`

## ![](../godot-addons/share/icon.png?raw=true) Installation
Share plugin consists of two parts
- Android plugin
- Godot addon

### ![](../godot-addons/share/icon.png?raw=true) Installing the Android plugin
Copy the following files from the release archive
- `Share.gdap`
- `Share-*-release.aar`

to the `android/plugins` directory

Then, enable the Godot Share plugin via `Project->Export...->Android` in the Godot Editor

### ![](../godot-addons/share/icon.png?raw=true) Installing the Godot addon
Unzip the `share-addon.zip` file inside the `addons/` directory

Then, enable the Godot Share addon via `Project->Project Settings...->Plugins` in the Godot Editor

## ![](../godot-addons/share/icon.png?raw=true) Usage
Add a `Share` node to your scene and follow the following steps:
- use one of the following methods of the `Share` node to share text or images:
    - `share_text(title, subject, content)`
    - `share_image(full_path_for_saved_image_file, title, subject, content)`
        - Note that the image you want to share must be saved under the `user://` virtual directory in order to be accessible. The `OS.get_user_data_dir()` method can be used to get the absolute path for the `user://` directory. See the implementation of `share_viewport()` method for sample code.
    - `share_viewport(viewport, title, subject, content)`

## ![](../godot-addons/share/icon.png?raw=true) Troubleshooting
`adb logcat` is one of the best tools for troubleshooting unexpected behavior
- use `$> adb logcat | grep 'godot'` on Linux
	- `adb logcat *:W` to see warnings and errors
	- `adb logcat *:E` to see only errors
	- `adb logcat | grep 'godot|somethingElse'` to filter using more than one string at the same time
- use `#> adb.exe logcat | select-string "godot"` on powershell (Windows)

Also check out:
https://docs.godotengine.org/en/stable/tutorials/platform/android/android_plugin.html#troubleshooting
