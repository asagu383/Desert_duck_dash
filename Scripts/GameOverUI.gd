extends Node2D

export var menu_UI_scene : PackedScene

func _on_NewGameButton_button_up():
	get_tree().change_scene(menu_UI_scene.resource_path)


