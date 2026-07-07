extends Panel
@onready var background_sprite_2d: Sprite2D = $Background
@onready var item_sprite_2d: Sprite2D = $CenterContainer/Panel/Item
@onready var amount_label: Label = $CenterContainer/Panel/Amount


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func update(inventory_item_slot: InventoryItemSlot) -> void:
	
	if not inventory_item_slot.item:
		background_sprite_2d.frame = 0
		item_sprite_2d.visible = false
		amount_label.visible = false
	else:
		background_sprite_2d.frame = 1
		item_sprite_2d.visible = true
		item_sprite_2d.texture = inventory_item_slot.item.icon
		amount_label.text = str(inventory_item_slot.amount)
		
		if inventory_item_slot.amount > 1:
			amount_label.visible = true
	pass	
