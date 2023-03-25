# ![](../godot-addons/notification_scheduler/icon.png?raw=true) Notification Scheduler Plugin

NotificationScheduler plugin allows scheduling of local mobile notifications

## ![](../godot-addons/notification_scheduler/icon.png?raw=true) Prerequisites
Follow instructions on the following page to create a custom Android build
- [Create custom Android build](https://docs.godotengine.org/en/stable/tutorials/export/android_custom_build.html)

Upgrade your target Android SDK version to 33 via `Project->Export...->Android->Target SDK`

## ![](../godot-addons/notification_scheduler/icon.png?raw=true) Installation
NotificationScheduler plugin consists of two parts
- Android plugin
- Godot addon

### ![](../godot-addons/notification_scheduler/icon.png?raw=true) Installing the Android plugin
Copy the following files from the release archive
- `NotificationScheduler.gdap`
- `NotificationScheduler-*-release.aar`

to the `android/plugins` directory

Then, enable the Godot Notification Scheduler plugin via `Project->Export...->Android` in the Godot Editor

### ![](../godot-addons/notification_scheduler/icon.png?raw=true) Installing the Godot addon
Unzip the `notification_scheduler-addon.zip` file inside the `addons/` directory

Then, enable the Godot Notification Scheduler addon via `Project->Project Settings...->Plugins` in the Godot Editor

## ![](../godot-addons/notification_scheduler/icon.png?raw=true) Usage
Prior to using this plugin, a notification icon should be generated. For instructions please visit the following link:
- https://developer.android.com/studio/write/create-app-icons#notification

Add a `NotificationScheduler` node to your scene and follow the following steps:
- register listeners for the following signals emitted from the `NotificationScheduler` node
    - `permission_granted`
	- `permission_denied`
- At startup, using the `NotificationScheduler` node to check that the application has permissions to post notifications:
```
	$NotificationScheduler.has_post_notifications_permission()
```
- If the application doesn't have permissions to post notifications, then request permission using the `NotificationScheduler` node:
```
	$NotificationScheduler.request_post_notifications_permission()
```
- `permission_granted` signal will be emitted when the application receives the permissions

- Create a notification channel using the `NotificationScheduler` node:
```
	$NotificationScheduler.create_notification_channel("my_channel_id", "My Channel Name", "My channel description")
```
- Build notification object:
```
	var my_notification_data = NotificationData.new()
	my_notification_data.set_id(__notification_id).\
			set_channel_id("my_channel_id").\
			set_title("My Notification Title").\
			set_content("My notification content").\
			set_small_icon_name("ic_name_of_the_icon_that_you_generated")
```
- Schedule notification using the `NotificationScheduler` node:
```
	$NotificationScheduler.schedule(
			my_notification_data.get_raw_data(),
			my_delay_in_seconds
		)
```

### ![](../godot-addons/notification_scheduler/icon.png?raw=true) Other Available Methods
- `schedule_repeating(notification_id, channel_id, title, content, delay, interval)`
- `schedule_with_deeplink(deeplink, notification_id, channel_id, title, content, delay)`
- `schedule_repeating_with_deeplink(deeplink, notification_id, channel_id, title, content, delay, interval)`
- `cancel(notification_id)`

## ![](../godot-addons/notification_scheduler/icon.png?raw=true) Troubleshooting
`adb logcat` is one of the best tools for troubleshooting unexpected behavior
- use `$> adb logcat | grep 'godot'` on Linux
	- `adb logcat *:W` to see warnings and errors
	- `adb logcat *:E` to see only errors
	- `adb logcat | grep 'godot|somethingElse'` to filter using more than one string at the same time
- use `#> adb.exe logcat | select-string "godot"` on powershell (Windows)

Also check out:
https://docs.godotengine.org/en/stable/tutorials/platform/android/android_plugin.html#troubleshooting
