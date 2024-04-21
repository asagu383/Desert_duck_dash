extends KinematicBody2D

var velocity = Vector2.ZERO

export var jump_velocity = 600.0
export var gravity_scale = 20.0

var score = 0

enum {
	JUMP,
	RUN,
	IDLE,
	DEAD
}

var current_state = RUN

onready var animation = $AnimatedSprite
onready var jump_sound = $JumpSound
onready var death_sound = $DeathSound

func _ready():
	Signals.connect("rewardplayer", self, "reward_player")
	Signals.connect("killplayer", self, "kill_player")

func _physics_process(delta):
	match current_state:
		JUMP:
			velocity = Vector2.ZERO
			velocity.y -= jump_velocity
			animation.play("Idle_1") #Change to Jump later when animation fixed
			jump_sound.play()
			
			current_state = IDLE
		RUN:
			animation.play("Run")
			
		IDLE:
			pass
			
		DEAD:
			animation.play("Death")
	
	
	velocity.y += gravity_scale
	move_and_collide(velocity*delta)
	

func _process(delta):
	if Input.is_action_pressed("Right"):
		position.x += 3
	
	if Input.is_action_pressed("Left"):
		position.x -= 3


func _input(event):
	if current_state == RUN and event.is_action_pressed("Jump"):
		current_state = JUMP

	
func _on_Area2D_body_entered(body):
	if body is StaticBody2D:
		current_state = RUN


func _on_Area2D_body_exited(body):
	if body is StaticBody2D:
		current_state = JUMP


func reward_player(score_to_add):
	score += score_to_add
	Signals.emit_signal("updatescore",score)


func kill_player():
	current_state = DEAD
	
	death_sound.play()
	yield(death_sound,"finished")
	
	queue_free()
