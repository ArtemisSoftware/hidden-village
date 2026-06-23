class_name Slime extends CharacterBody2D

@export var speed = 30
@export var movement_limit = 0.5
@export var end_point_marker: Marker2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


var start_position
var end_position

func _ready() -> void:
	start_position = position
	end_position = end_point_marker.global_position
	pass
	


func _physics_process(delta: float) -> void:
	_update_velocity()
	move_and_slide()
	_update_animation()
	pass

func _update_velocity()	-> void:
	
	var move_direction = end_position - position
	
	if move_direction.length() < movement_limit:
		_change_direction()
	
	velocity = move_direction.normalized() * speed
	pass
	
func _change_direction()	-> void:
	
	var temp_end_position = end_position
	end_position = start_position
	start_position = temp_end_position
	pass	
	
func _update_animation():
	var animation = "walk_up"
	
	if velocity.y > 0:
		animation = "walk_down"	
		
	animated_sprite_2d.play(animation)
	pass
	
