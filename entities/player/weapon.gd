extends Node2D

var weapon: Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if get_children().is_empty(): return
	
	weapon = get_children()[0]
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func draw_weapon(should_draw: bool = true) -> void:
	if not weapon: return
	
	visible = should_draw
	weapon.toggleEnabled(not should_draw)
	pass
