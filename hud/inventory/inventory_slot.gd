extends Panel
@onready var background_sprite_2d: Sprite2D = $Background
@onready var item_sprite_2d: Sprite2D = $CenterContainer/Panel/Item


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func update(inventory_item: InventoryItem) -> void:
	
	if not inventory_item:
		background_sprite_2d.frame = 0
		item_sprite_2d.visible = false
	else:
		background_sprite_2d.frame = 1
		item_sprite_2d.visible = true
		item_sprite_2d.texture = inventory_item.icon
	pass	
