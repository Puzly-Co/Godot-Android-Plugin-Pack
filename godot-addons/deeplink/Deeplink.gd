tool
class_name Deeplink
extends Node

signal deeplink_received(url, scheme, host, path)

const PLUGIN_SINGLETON_NAME: String = "Deeplink"

var _plugin_singleton: Object

var _url: String
var _scheme: String
var _host: String
var _path: String


func _ready() -> void:
	_update_plugin()


func _notification(a_what: int) -> void:
	if a_what == NOTIFICATION_APP_RESUMED:
		_update_plugin()


func _update_plugin() -> void:
	if Engine.has_singleton(PLUGIN_SINGLETON_NAME):
		_plugin_singleton = Engine.get_singleton(PLUGIN_SINGLETON_NAME)
		_url = str(_plugin_singleton.getUrl())
		_scheme = str(_plugin_singleton.getScheme())
		_host = str(_plugin_singleton.getHost())
		_path = str(_plugin_singleton.getPath())

		_plugin_singleton.clearData()

		emit_signal("deeplink_received", _url, _scheme, _host, _path)
	else:
		printerr("%s singleton not found!" % PLUGIN_SINGLETON_NAME)


func get_link_url() -> String:
	return _url


func get_link_scheme() -> String:
	return _scheme


func get_link_host() -> String:
	return _host


func get_link_path() -> String:
	return _path
