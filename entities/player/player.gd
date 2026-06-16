class_name Player extends CharacterBody2D

@export var speed: int = 35

func _physics_process(delta: float) -> void:
	
	_handle_input()
	move_and_slide()
	pass

func _handle_input()-> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed
	pass
