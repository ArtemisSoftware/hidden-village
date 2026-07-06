class_name Collectable extends Area2D


@export var inventory_item: InventoryItem

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func collect(inventory: Inventory) -> void:
	inventory.insert(inventory_item)
	queue_free()
	pass
