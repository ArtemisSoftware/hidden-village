class_name Heart extends Panel

@onready var sprite_2d: Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update(fraction: int) -> void:
	
	match fraction:
		0: sprite_2d.frame = 4
		1: sprite_2d.frame = 3
		2: sprite_2d.frame = 2
		3: sprite_2d.frame = 1
		4: sprite_2d.frame = 0

	pass
