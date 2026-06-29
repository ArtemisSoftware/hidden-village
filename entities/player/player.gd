class_name Player extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var effects_animation_player: AnimationPlayer = $EffectsAnimationPlayer
@onready var hurt_blink_timer: Timer = $HurtBlinkTimer

@export var speed: int = 35

@export var max_health: int = 3
@onready var current_health: int = max_health

@export var knock_back_power: int = 500

signal health_changed


func _ready() -> void:
	effects_animation_player.play("RESET")
	pass

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


func _on_hurt_box_area_entered(area: Area2D) -> void:
	
	if area.name == "HitBox":
		current_health -= 1
		
		if current_health <= 0:
			current_health = max_health
		
		health_changed.emit(current_health)
		_knock_back(area.get_parent().velocity)
	pass # Replace with function body.

func _knock_back(enemy_velocity: Vector2) -> void:
	
	var knock_back_direction = (enemy_velocity -velocity).normalized() * knock_back_power
	velocity = knock_back_direction
	move_and_slide()
	
	effects_animation_player.play("hurt_blink")
	hurt_blink_timer.start()
	await hurt_blink_timer.timeout
	effects_animation_player.play("RESET")
	pass
