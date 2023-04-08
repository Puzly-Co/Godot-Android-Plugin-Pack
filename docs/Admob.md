# ![](../godot-addons/admob/icon.png?raw=true) Admob Plugin

Admob plugin allows displaying of Admob ads

_Based on Shin-NiL's [Godot AdMob plugin](https://github.com/Shin-NiL/Godot-Android-Admob-Plugin)_

## ![](../godot-addons/admob/icon.png?raw=true) Prerequisites
Follow instructions on the following page to create a custom Android build
- [Create custom Android build](https://docs.godotengine.org/en/stable/tutorials/export/android_custom_build.html)

Upgrade your target Android SDK version to 33 via `Project->Export...->Android->Target SDK`

Create an AdMob account at the following link:
- [Google AdMob](https://admob.google.com/)

## ![](../godot-addons/admob/icon.png?raw=true) Installation
Admob plugin consists of two parts
- Android plugin
- Godot addon

### ![](../godot-addons/admob/icon.png?raw=true) Installing the Android plugin
Copy the following files from the release archive
- `Admob.gdap`
- `Admob-*-release.aar`

to the `android/plugins` directory

Then, enable the Godot Admob plugin via `Project->Export...->Android` in the Godot Editor

### ![](../godot-addons/admob/icon.png?raw=true) Installing the Godot addon
Unzip the `admob-addon.zip` file inside the `addons/` directory

Then, enable the Godot Admob addon via `Project->Project Settings...->Plugins` in the Godot Editor

## ![](../godot-addons/admob/icon.png?raw=true) Usage
Update your Godot app's `AndroidManifest.xml` file to add a declaration for your AdMob `APPLICATION_ID` after the closing Godot `</activity>` tag:
```xml
<?xml version="1.0" encoding="utf-8"?>
<manifest xmlns:android="http://schemas.android.com/apk/res/android" ...>

    ...

    <application android:label="@string/godot_project_name_string" android:allowBackup="false" ...>
    	<activity
        	android:name=".GodotApp"
        	android:label="@string/godot_project_name_string" ...>
        	...
		</activity>

		<meta-data
			tools:replace="android:value"
			android:name="com.google.android.gms.ads.APPLICATION_ID"
			android:value="ca-app-pub-0000000000000000~0000000000"/>

<!-- Custom application XML added by add-ons. -->
<!--CHUNK_APPLICATION_BEGIN-->
<!--CHUNK_APPLICATION_END-->

    </application>

</manifest>
```
Add an `Admob` node to your scene and follow the following steps:
- register listeners for one or more of the following signals of the `Admob` node:
    - `banner_loaded`
    - `banner_failed_to_load`
    - `interstitial_loaded`
    - `interstitial_opened`
    - `interstitial_closed`
    - `interstitial_clicked`
    - `interstitial_impression`
    - `interstitial_failed_to_load`
    - `interstitial_failed_to_show`
    - `rewarded_video_opened`
    - `rewarded_video_loaded`
    - `rewarded_video_closed`
    - `rewarded_video_failed_to_load`
    - `rewarded_video_failed_to_show`
    - `rewarded_interstitial_opened`
    - `rewarded_interstitial_loaded`
    - `rewarded_interstitial_closed`
    - `rewarded_interstitial_failed_to_load`
    - `rewarded_interstitial_failed_to_show`
    - `rewarded`
    - `rewarded_clicked`
    - `rewarded_impression`
- use one or more of the following `load_*()` methods to load ads from the `Admob` node:
    - `load_banner()`
	- `load_interstitial()`
	- `load_rewarded_video()`
	- `load_rewarded_interstitial()`
- once ads have been loaded, call corresponding `show_*()` method from the `Admob` node:
    - `show_banner()`
	- `show_interstitial()`
	- `show_rewarded_video()`
	- `show_rewarded_interstitial()`

## ![](../godot-addons/admob/icon.png?raw=true) Troubleshooting
`adb logcat` is one of the best tools for troubleshooting unexpected behavior
- use `$> adb logcat | grep 'godot'` on Linux
	- `adb logcat *:W` to see warnings and errors
	- `adb logcat *:E` to see only errors
	- `adb logcat | grep 'godot|somethingElse'` to filter using more than one string at the same time
- use `#> adb.exe logcat | select-string "godot"` on powershell (Windows)

Also check out:
https://docs.godotengine.org/en/stable/tutorials/platform/android/android_plugin.html#troubleshooting
