# ![](../godot-addons/inapp_review/icon.png?raw=true) In-app Review Plugin

In-app review plugin enables access to Google Play Store's in-app review functionality

## ![](../godot-addons/inapp_review/icon.png?raw=true) Prerequisites
Follow instructions on the following page to create a custom Android build
- [Create custom Android build](https://docs.godotengine.org/en/stable/tutorials/export/android_custom_build.html)

Upgrade your target Android SDK version to 33 via `Project->Export...->Android->Target SDK`

## ![](../godot-addons/inapp_review/icon.png?raw=true) Installation
In-app review plugin consists of two parts
- Android plugin
- Godot addon

### ![](../godot-addons/inapp_review/icon.png?raw=true) Installing the Android plugin
Copy the following files from the release archive
- `InappReview.gdap`
- `InappReview-*-release.aar`

to the `android/plugins` directory

Then, enable the Godot In-app Review plugin via `Project->Export...->Android` in the Godot Editor

### ![](../godot-addons/inapp_review/icon.png?raw=true) Installing the Godot addon
Unzip the `inapp_review-addon.zip` file inside the `addons/` directory

Then, enable the Godot Inapp Review addon via `Project->Project Settings...->Plugins` in the Godot Editor

## ![](../godot-addons/inapp_review/icon.png?raw=true) Usage
Add an `InappReview` node to your scene and follow the following steps:
- register listeners for the following signals emitted from the `InappReview` node
    - `review_info_generated`
	- `review_info_generation_failed`
	- `review_flow_launched`
	- `review_flow_launch_failed`
- call the `generate_review_info()` method of the `InappReview` node
- when the `review_info_generated` signal is received, call the `launch_review_flow()` of the `InappReview` node
	- Google Play Store API will display a dialog
	- Dialog may not be displayed if the review flow was launched recently
- normal app functionality can resume when `review_flow_launched` signal is received

## ![](../godot-addons/inapp_review/icon.png?raw=true) Troubleshooting
`adb logcat` is one of the best tools for troubleshooting unexpected behavior
- use `$> adb logcat | grep 'godot'` on Linux
	- `adb logcat *:W` to see warnings and errors
	- `adb logcat *:E` to see only errors
	- `adb logcat | grep 'godot|somethingElse'` to filter using more than one string at the same time
- use `#> adb.exe logcat | select-string "godot"` on powershell (Windows)

Also check out:
https://docs.godotengine.org/en/stable/tutorials/platform/android/android_plugin.html#troubleshooting
