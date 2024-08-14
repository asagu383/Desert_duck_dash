extends Node2D

export var menu_UI_scene : PackedScene

func _on_ReturnButton_button_up():
	#Return to main menu
	get_tree().change_scene(menu_UI_scene.resource_path)
