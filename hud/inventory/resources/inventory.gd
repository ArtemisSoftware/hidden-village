class_name Inventory extends Resource

@export var slots: Array[InventoryItemSlot]

signal inventory_updated

func insert(inventory_item: InventoryItem) -> void:
	
	for slot in slots:
		if slot.item == inventory_item:
			slot.amount += 1
			inventory_updated.emit()	
			return
			
	
	for index in range(slots.size()):
		if not slots[index].item:
			slots[index].item = inventory_item
			slots[index].amount = 1
			break
	inventory_updated.emit()		
	pass
