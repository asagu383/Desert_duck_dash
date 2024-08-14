extends Node2D

export var main_game_scene : PackedScene
onready var animation = $PlayerAnimation

func _ready():
	animation.play("Idle")

func _on_PlayButton_button_up():
	#Game starts when Play button pressed
	get_tree().change_scene(main_game_scene.resource_path)


func _on_QuitButton_button_up():
	#Closes game
	get_tree().quit()
