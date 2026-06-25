extends CanvasLayer

@onready var heart_container: HealtHud = $HeartContainer
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
