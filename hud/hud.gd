extends CanvasLayer

@onready var heart_container: HealtHud = $HeartContainer
@onready var inventory_hud: InventoryHud = $InventoryHud


@export var player: Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	heart_container.set_max_health(player.max_health)
	heart_container.update_health(player.current_health)
	player.health_changed.connect(heart_container.update_health)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("toggle_inventory"):
		inventory_hud.toggle()
	
	pass


func _on_inventory_hud_inventory_closed() -> void:
	get_tree().paused = false
	pass 


func _on_inventory_hud_inventory_opened() -> void:
	get_tree().paused = true
	pass 
