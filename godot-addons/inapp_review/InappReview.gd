tool
class_name InappReview
extends Node

signal review_info_generated()
signal review_info_generation_failed()
signal review_flow_launched()
signal review_flow_launch_failed()

const SIGNAL_NAME_REVIEW_INFO_GENERATED: String = "review_info_generated";
const SIGNAL_NAME_REVIEW_INFO_GENERATION_FAILED: String = "review_info_generation_failed";
const SIGNAL_NAME_REVIEW_FLOW_LAUNCHED: String = "review_flow_launched";
const SIGNAL_NAME_REVIEW_FLOW_LAUNCH_FAILED: String = "review_flow_launch_failed";

const PLUGIN_SINGLETON_NAME: String = "InappReview"

var _plugin_singleton: Object


func _ready() -> void:
	_update_plugin()


func _notification(a_what: int) -> void:
	if a_what == NOTIFICATION_APP_RESUMED:
		_update_plugin()


func _update_plugin() -> void:
	if _plugin_singleton == null:
		if Engine.has_singleton(PLUGIN_SINGLETON_NAME):
			_plugin_singleton = Engine.get_singleton(PLUGIN_SINGLETON_NAME)
			_connect_signals()
		else:
			printerr("%s singleton not found!" % PLUGIN_SINGLETON_NAME)


func _connect_signals() -> void:
	_plugin_singleton.connect(SIGNAL_NAME_REVIEW_INFO_GENERATED, self, "on_review_info_generated")
	_plugin_singleton.connect(SIGNAL_NAME_REVIEW_INFO_GENERATION_FAILED, self, "on_review_info_generation_failed")
	_plugin_singleton.connect(SIGNAL_NAME_REVIEW_FLOW_LAUNCHED, self, "on_review_flow_launched")
	_plugin_singleton.connect(SIGNAL_NAME_REVIEW_FLOW_LAUNCH_FAILED, self, "on_review_flow_launch_failed")


func generate_review_info() -> void:
	if _plugin_singleton != null:
		_plugin_singleton.generateReviewInfo()
	else:
		printerr("%s plugin not initialized" % PLUGIN_SINGLETON_NAME)


func launch_review_flow() -> void:
	if _plugin_singleton != null:
		_plugin_singleton.launchReviewFlow()
	else:
		printerr("%s plugin not initialized" % PLUGIN_SINGLETON_NAME)


func on_review_info_generated() -> void:
	emit_signal(SIGNAL_NAME_REVIEW_INFO_GENERATED)


func on_review_info_generation_failed() -> void:
	emit_signal(SIGNAL_NAME_REVIEW_INFO_GENERATION_FAILED)


func on_review_flow_launched() -> void:
	emit_signal(SIGNAL_NAME_REVIEW_FLOW_LAUNCHED)


func on_review_flow_launch_failed() -> void:
	emit_signal(SIGNAL_NAME_REVIEW_FLOW_LAUNCH_FAILED)
