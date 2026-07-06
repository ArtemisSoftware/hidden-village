class_name Inventory extends Resource

@export var inventory: Array[InventoryItem]

signal inventory_updated

func insert(inventory_item: InventoryItem) -> void:
	for index in range(inventory.size()):
		if not inventory[index]:
			inventory[index] = inventory_item
			break
	inventory_updated.emit()		
	pass
