class_name Sword extends Collectable

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func collect(inventory: Inventory):
	animation_player.play("spin")
	await  animation_player.animation_finished
	super.collect(inventory)
	pass

func toggleEnabled(is_disabled: bool = true) -> void:
	collision_shape_2d.disabled = is_disabled
	pass
