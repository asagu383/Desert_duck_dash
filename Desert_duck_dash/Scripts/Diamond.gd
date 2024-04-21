extends "ScrollMovement.gd"

onready var pickup_sound = $PickupSound

func _physics_process(delta):
	move()


func _on_Pickup_body_entered(body):
	if body.name == "Player":
		self.hide()
		pickup_sound.play()
		Signals.emit_signal("rewardplayer", 1) #For score when diamond picked up
		
		yield(pickup_sound,"finished")
		queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
