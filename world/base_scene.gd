class_name BaseScene extends Node

@onready var player: Player = $Player
@onready var entrance_marker: Node2D = $EntranceMarkers


func _ready() -> void:
	if SceneManagerGlobal.player:
		if player:
			player.queue_free()
			
		player = SceneManagerGlobal.player
		add_child(player)	
	postion_player()	
	pass
	
func postion_player() -> void:
	
	var last_scene = SceneManagerGlobal.last_scene_name
	
	if last_scene.is_empty():
		last_scene = "any"
	
	if entrance_marker.get_children().size() > 0:
		
		var marker: Marker2D = entrance_marker.get_children()[0]
		player.global_position = marker.global_position
	pass	
