class_name Slime extends CharacterBody2D

@export var speed = 30
@export var movement_limit = 0.5
@export var end_point_marker: Marker2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var hit_box: Area2D = $HitBox


var start_position
var end_position
var is_dead: bool = false

func _ready() -> void:
	start_position = position
	end_position = end_point_marker.global_position
	pass
	


func _physics_process(delta: float) -> void:
	if is_dead: return
	_update_velocity()
	move_and_slide()
	_handle_collision()
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
	if velocity.length() == 0:
		animation_player.stop()
		return
	
	var direction = "down"
	
	if velocity.x < 0: direction = "left"
	elif velocity.x > 0: direction = "right"
	elif velocity.y < 0: direction = "up"
	
	animation_player.play("walk" + "_" + direction)
	pass
	
	
func _handle_collision() -> void:
	
	for index in get_slide_collision_count():
		var collision = get_slide_collision(index)
		var collider = collision.get_collider()
		
	
	pass	


func _on_hurt_box_area_entered(area: Area2D) -> void:
	hit_box.set_deferred("monitorable", false)
	is_dead = true
	animation_player.play("death")
	await animation_player.animation_finished
	queue_free()
	pass # Replace with function body.
