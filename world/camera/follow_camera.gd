class_name FollowCamera extends Camera2D

@export var tilemap_layer: TileMapLayer
@export var follow_node: Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	var map_rect: Rect2i = tilemap_layer.get_used_rect()

	# Correct way to get tile size in Godot 4.x
	var tile_size: Vector2i = tilemap_layer.tile_set.tile_size

	# Convert tile coordinates -> pixel coordinates
	var world_size_in_pixels: Vector2 = Vector2(map_rect.size) * Vector2(tile_size)

	# Account for map origin (important if map doesn't start at 0,0)
	var world_origin: Vector2 = Vector2(map_rect.position) * Vector2(tile_size)

	limit_left = int(world_origin.x)
	limit_top = int(world_origin.y)
	limit_right = int(world_origin.x + world_size_in_pixels.x)
	limit_bottom = int(world_origin.y + world_size_in_pixels.y)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = follow_node.global_position
	pass
