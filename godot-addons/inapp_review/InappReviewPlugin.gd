tool
extends EditorPlugin

const PLUGIN_NODE_TYPE_NAME = "InappReview"
const PLUGIN_PARENT_NODE_TYPE = "Node"


func _enter_tree() -> void:
	add_custom_type(PLUGIN_NODE_TYPE_NAME, PLUGIN_PARENT_NODE_TYPE, preload("InappReview.gd"), preload("icon.png"))


func _exit_tree() -> void:
	remove_custom_type(PLUGIN_NODE_TYPE_NAME)
