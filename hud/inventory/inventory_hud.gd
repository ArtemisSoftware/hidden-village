class_name InventoryHud extends Control

signal inventory_opened
signal inventory_closed

var is_open: bool = true
const PLAYER_INVENTORY = preload("uid://cqqrranur12so")
@onready var grid_container: GridContainer = $NinePatchRect/GridContainer

var slots: Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	slots = grid_container.get_children()
	toggle()
	update()
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

func update() -> void:
	for index in range(min(PLAYER_INVENTORY.items.size(), slots.size())):
		slots[index].update(PLAYER_INVENTORY.items[index])
	pass
