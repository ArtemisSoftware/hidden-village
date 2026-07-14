class_name SceneTrigger extends Area2D

@export var connect_scene: String

var scene_folder = "res://world/"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		SceneManagerGlobal.change_scene(owner, connect_scene)
	pass # Replace with function body.
