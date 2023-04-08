tool
class_name Admob
extends Node

signal banner_loaded
signal banner_failed_to_load(error_code)
signal interstitial_loaded
signal interstitial_opened
signal interstitial_closed
signal interstitial_clicked
signal interstitial_impression
signal interstitial_failed_to_load(error_code)
signal interstitial_failed_to_show(error_code)
signal rewarded_video_opened
signal rewarded_video_loaded
signal rewarded_video_closed
signal rewarded_video_failed_to_load(error_code)
signal rewarded_video_failed_to_show(error_code)
signal rewarded_interstitial_opened
signal rewarded_interstitial_loaded
signal rewarded_interstitial_closed
signal rewarded_interstitial_failed_to_load(error_code)
signal rewarded_interstitial_failed_to_show(error_code)
signal rewarded(currency, amount)
signal rewarded_clicked
signal rewarded_impression

export var is_real: bool setget is_real_set
export var is_banner_on_top: bool = true
export(String, "ADAPTIVE_BANNER", "BANNER", "LARGE_BANNER", "MEDIUM_RECTANGLE", "FULL_BANNER", "LEADERBOARD") var banner_size = "ADAPTIVE_BANNER"
export var banner_id: String
export var interstitial_id: String
export var rewarded_id: String
export var rewarded_interstitial_id: String
export var child_directed: bool = false setget child_directed_set
export var is_personalized: bool = true setget is_personalized_set
export(String, "G", "PG", "T", "MA") var max_ad_content_rate = DEFAULT_CONTENT_RATING setget max_ad_content_rate_set

const PLUGIN_SINGLETON_NAME: String = "Admob"
const VALID_CONTENT_RATINGS: Array = ["G", "PG", "T", "MA"]
const DEFAULT_CONTENT_RATING: String = "G"

var _plugin_singleton: Object

var _is_interstitial_loaded: bool = false
var _is_rewarded_video_loaded: bool = false
var _is_rewarded_interstitial_loaded: bool = false


func _ready() -> void:
	_update_plugin()


func _notification(a_what: int) -> void:
	if a_what == NOTIFICATION_APP_RESUMED:
		_update_plugin()


func _update_plugin() -> void:
	if _plugin_singleton == null and Engine.has_singleton(PLUGIN_SINGLETON_NAME):
		_plugin_singleton = Engine.get_singleton(PLUGIN_SINGLETON_NAME)
		_connect_signals()

		configure_ads()


func _connect_signals() -> void:
	_plugin_singleton.connect("banner_loaded", self, "_on_banner_loaded")
	_plugin_singleton.connect("banner_failed_to_load", self, "_on_banner_failed_to_load")
	_plugin_singleton.connect("interstitial_opened", self, "_on_interstitial_opened")
	_plugin_singleton.connect("interstitial_loaded", self, "_on_interstitial_loaded")
	_plugin_singleton.connect("interstitial_closed", self, "_on_interstitial_closed")
	_plugin_singleton.connect("interstitial_clicked", self, "_on_interstitial_clicked")
	_plugin_singleton.connect("interstitial_impression", self, "_on_interstitial_impression")
	_plugin_singleton.connect("interstitial_failed_to_load", self, "_on_interstitial_failed_to_load")
	_plugin_singleton.connect("interstitial_failed_to_show", self, "_on_interstitial_failed_to_show")
	_plugin_singleton.connect("rewarded_video_loaded", self, "_on_rewarded_video_loaded")
	_plugin_singleton.connect("rewarded_video_opened", self, "_on_rewarded_video_opened")
	_plugin_singleton.connect("rewarded_video_closed", self, "_on_rewarded_video_closed")
	_plugin_singleton.connect("rewarded_video_failed_to_load", self, "_on_rewarded_video_failed_to_load")
	_plugin_singleton.connect("rewarded_video_failed_to_show", self, "_on_rewarded_video_failed_to_show")
	_plugin_singleton.connect("rewarded_interstitial_loaded", self, "_on_rewarded_interstitial_loaded")
	_plugin_singleton.connect("rewarded_interstitial_opened", self, "_on_rewarded_interstitial_opened")
	_plugin_singleton.connect("rewarded_interstitial_closed", self, "_on_rewarded_interstitial_closed")
	_plugin_singleton.connect("rewarded_interstitial_failed_to_load", self, "_on_rewarded_interstitial_failed_to_load")
	_plugin_singleton.connect("rewarded_interstitial_failed_to_show", self, "_on_rewarded_interstitial_failed_to_show")
	_plugin_singleton.connect("rewarded", self, "_on_rewarded")
	_plugin_singleton.connect("rewarded_clicked", self, "_on_rewarded_clicked")
	_plugin_singleton.connect("rewarded_impression", self, "_on_rewarded_impression")


func is_real_set(a_value: bool) -> void:
	is_real = a_value
	configure_ads()


func child_directed_set(a_value: bool) -> void:
	child_directed = a_value
	configure_ads()


func is_personalized_set(a_value: bool) -> void:
	is_personalized = a_value
	configure_ads()


func max_ad_content_rate_set(a_value: String) -> void:
	if a_value in VALID_CONTENT_RATINGS:
		max_ad_content_rate = a_value
	else:
		max_ad_content_rate = DEFAULT_CONTENT_RATING
		printerr("Invalid max_ad_content_rate value: '%s'. Using '%s'" % [a_value, max_ad_content_rate])

	configure_ads()


func configure_ads() -> void:
	if _plugin_singleton != null:
		_plugin_singleton.initWithContentRating(
			is_real,
			child_directed,
			is_personalized,
			max_ad_content_rate
		)
	else:
		printerr("%s plugin not initialized" % PLUGIN_SINGLETON_NAME)


func load_banner() -> void:
	if _plugin_singleton != null:
		_plugin_singleton.loadBanner(banner_id, is_banner_on_top, banner_size)
	else:
		printerr("%s plugin not initialized" % PLUGIN_SINGLETON_NAME)


func load_interstitial() -> void:
	if _plugin_singleton != null:
		_plugin_singleton.loadInterstitial(interstitial_id)
	else:
		printerr("%s plugin not initialized" % PLUGIN_SINGLETON_NAME)


func is_interstitial_loaded() -> bool:
	if _plugin_singleton != null:
		return _is_interstitial_loaded
	else:
		printerr("%s plugin not initialized" % PLUGIN_SINGLETON_NAME)

	return false


func load_rewarded_video() -> void:
	if _plugin_singleton != null:
		_plugin_singleton.loadRewardedVideo(rewarded_id)
	else:
		printerr("%s plugin not initialized" % PLUGIN_SINGLETON_NAME)


func is_rewarded_video_loaded() -> bool:
	if _plugin_singleton != null:
		return _is_rewarded_video_loaded
	else:
		printerr("%s plugin not initialized" % PLUGIN_SINGLETON_NAME)

	return false


func load_rewarded_interstitial() -> void:
	if _plugin_singleton != null:
		if _plugin_singleton.is_connected("rewarded", self, "_on_rewarded"):
			print_debug("rewarded signal is connected")
		_plugin_singleton.loadRewardedInterstitial(rewarded_interstitial_id)
	else:
		printerr("%s plugin not initialized" % PLUGIN_SINGLETON_NAME)


func is_rewarded_interstitial_loaded() -> bool:
	if _plugin_singleton != null:
		return _is_rewarded_interstitial_loaded
	else:
		printerr("%s plugin not initialized" % PLUGIN_SINGLETON_NAME)

	return false


func show_banner() -> void:
	if _plugin_singleton != null:
		_plugin_singleton.showBanner()
	else:
		printerr("%s plugin not initialized" % PLUGIN_SINGLETON_NAME)


func hide_banner() -> void:
	if _plugin_singleton != null:
		_plugin_singleton.hideBanner()
	else:
		printerr("%s plugin not initialized" % PLUGIN_SINGLETON_NAME)


func move_banner(a_on_top: bool) -> void:
	if _plugin_singleton != null:
		is_banner_on_top = a_on_top
		_plugin_singleton.moveBanner(is_banner_on_top)
	else:
		printerr("%s plugin not initialized" % PLUGIN_SINGLETON_NAME)


func show_interstitial() -> void:
	if _plugin_singleton != null:
		_plugin_singleton.showInterstitial()
		_is_interstitial_loaded = false
	else:
		printerr("%s plugin not initialized" % PLUGIN_SINGLETON_NAME)


func show_rewarded_video() -> void:
	if _plugin_singleton != null:
		_plugin_singleton.showRewardedVideo()
		_is_rewarded_video_loaded = false
	else:
		printerr("%s plugin not initialized" % PLUGIN_SINGLETON_NAME)


func show_rewarded_interstitial() -> void:
	if _plugin_singleton != null:
		_plugin_singleton.showRewardedInterstitial()
		_is_rewarded_interstitial_loaded = false
	else:
		printerr("%s plugin not initialized" % PLUGIN_SINGLETON_NAME)


func resize_banner() -> void:
	if _plugin_singleton != null:
		_plugin_singleton.resizeBanner()
	else:
		printerr("%s plugin not initialized" % PLUGIN_SINGLETON_NAME)


func get_banner_dimension() -> Vector2:
	if _plugin_singleton != null:
		return Vector2(_plugin_singleton.getBannerWidth(), _plugin_singleton.getBannerHeight())
	else:
		printerr("%s plugin not initialized" % PLUGIN_SINGLETON_NAME)

	return Vector2()


func _on_banner_loaded() -> void:
	emit_signal("banner_loaded")


func _on_banner_failed_to_load(a_error_code: int) -> void:
	emit_signal("banner_failed_to_load", a_error_code)


func _on_interstitial_opened() -> void:
	emit_signal("interstitial_opened")


func _on_interstitial_loaded() -> void:
	_is_interstitial_loaded = true
	emit_signal("interstitial_loaded")


func _on_interstitial_closed() -> void:
	emit_signal("interstitial_closed")


func _on_interstitial_clicked() -> void:
	emit_signal("interstitial_clicked")


func _on_interstitial_impression() -> void:
	emit_signal("interstitial_impression")


func _on_interstitial_failed_to_load(a_error_code: int) -> void:
	_is_interstitial_loaded = false
	emit_signal("interstitial_failed_to_load", a_error_code)


func _on_interstitial_failed_to_show(a_error_code: int) -> void:
	_is_interstitial_loaded = false
	emit_signal("interstitial_failed_to_show", a_error_code)


func _on_rewarded_video_loaded() -> void:
	_is_rewarded_video_loaded = true
	emit_signal("rewarded_video_loaded")


func _on_rewarded_video_opened() -> void:
	emit_signal("rewarded_video_opened")


func _on_rewarded_video_closed() -> void:
	emit_signal("rewarded_video_closed")


func _on_rewarded_video_failed_to_load(a_error_code: int) -> void:
	_is_rewarded_video_loaded = false
	emit_signal("rewarded_video_failed_to_load", a_error_code)


func _on_rewarded_video_failed_to_show(a_error_code: int) -> void:
	_is_rewarded_video_loaded = false
	emit_signal("rewarded_video_failed_to_show", a_error_code)


func _on_rewarded_interstitial_opened() -> void:
	emit_signal("rewarded_interstitial_opened")


func _on_rewarded_interstitial_loaded() -> void:
	_is_rewarded_interstitial_loaded = true
	emit_signal("rewarded_interstitial_loaded")


func _on_rewarded_interstitial_closed() -> void:
	emit_signal("rewarded_interstitial_closed")


func _on_rewarded_interstitial_failed_to_load(a_error_code: int) -> void:
	_is_rewarded_interstitial_loaded = false
	emit_signal("rewarded_interstitial_failed_to_load", a_error_code)


func _on_rewarded_interstitial_failed_to_show(a_error_code: int) -> void:
	_is_rewarded_interstitial_loaded = false
	emit_signal("rewarded_interstitial_failed_to_show", a_error_code)


func _on_rewarded(a_currency: String, a_amount: int) -> void:
	emit_signal("rewarded", a_currency, a_amount)


func _on_rewarded_clicked() -> void:
	emit_signal("rewarded_clicked")


func _on_rewarded_impression() -> void:
	emit_signal("rewarded_impression")
