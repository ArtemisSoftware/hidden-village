class_name Player extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var effects_animation_player: AnimationPlayer = $EffectsAnimationPlayer
@onready var hurt_blink_timer: Timer = $HurtBlinkTimer
@onready var hurt_box: Area2D = $HurtBox
@onready var weapon: Node2D = $Weapon

@export var speed: int = 35

@export var max_health: int = 3
@onready var current_health: int = max_health

@export var knock_back_power: int = 500
@export var inventory: Inventory

signal health_changed

var last_animated_direction: String = "down"
var is_hurt: bool = false
var is_attacking: bool = false

func _ready() -> void:
	effects_animation_player.play("RESET")
	pass

func _physics_process(delta: float) -> void:
	
	_handle_input()
	move_and_slide()
	_update_animation()
	
	if not is_hurt:
		for area in hurt_box.get_overlapping_areas():
			if area.name == "HitBox":
				_hurt_by_enemy(area)
	
	pass

func _handle_input()-> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed
	
	if Input.is_action_just_pressed("attack"):
		_attack()

	pass
	
func _update_animation()-> void:
	
	if is_attacking: return
	
	if velocity.length() == 0:
		animation_player.stop()
		animation_player.play("walk" + "_" + last_animated_direction)
		return
	
	var direction = "down"
	
	if velocity.x < 0: direction = "left"
	elif velocity.x > 0: direction = "right"
	elif velocity.y < 0: direction = "up"
	
	animation_player.play("walk" + "_" + direction)
	last_animated_direction = direction
	pass	

func _hurt_by_enemy(area: Area2D) -> void:
	current_health -= 1
		
	if current_health <= 0:
		current_health = max_health
	
	health_changed.emit(current_health)
	is_hurt = true
	_knock_back(area.get_parent().velocity)
	pass


func _knock_back(enemy_velocity: Vector2) -> void:
	
	var knock_back_direction = (enemy_velocity -velocity).normalized() * knock_back_power
	velocity = knock_back_direction
	move_and_slide()
	
	effects_animation_player.play("hurt_blink")
	hurt_blink_timer.start()
	await hurt_blink_timer.timeout
	effects_animation_player.play("RESET")
	is_hurt = false
	pass
	
func _attack() -> void:
	animation_player.play("attack_" + last_animated_direction)
	is_attacking = true
	weapon.draw_weapon()
	await  animation_player.animation_finished
	weapon.draw_weapon(false)
	is_attacking = false	
	pass	

func _on_hurt_box_area_entered(area: Area2D) -> void:
	
	if area.has_method("collect"):
		if area.collected == false:
			area.collect(inventory)
	
	pass # Replace with function body.


func _on_hurt_box_area_exited(area: Area2D) -> void:
	pass # Replace with function body.
