class_name Sword extends Collectable

@onready var animation_player: AnimationPlayer = $AnimationPlayer


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
