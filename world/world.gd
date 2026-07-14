extends BaseScene
@onready var follow_camera: FollowCamera = $FollowCamera


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super()
	follow_camera.follow_node = player
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
