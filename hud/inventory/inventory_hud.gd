class_name InventoryHud extends Control

signal inventory_opened
signal inventory_closed

var is_open: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	toggle()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func toggle() -> void:
	is_open = not is_open
	visible = is_open
	
	if is_open: inventory_opened.emit()
	else: inventory_closed.emit()
	
	pass
