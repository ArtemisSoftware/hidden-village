class_name Player extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

@export var speed: int = 35

func _physics_process(delta: float) -> void:
	
	_handle_input()
	move_and_slide()
	_update_animation()
	pass

func _handle_input()-> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed
	pass
	
func _update_animation()-> void:
	if velocity.length() == 0:
		animation_player.stop()
		return
	
	var direction = "down"
	
	if velocity.x < 0: direction = "left"
	elif velocity.x > 0: direction = "right"
	elif velocity.y < 0: direction = "up"
	
	animation_player.play("walk" + "_" + direction)
	pass	
