class_name HealtHud extends HBoxContainer

const HEART = preload("uid://bslevyetreva")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func set_max_health(max: int) -> void:
	for index in range(max):
		var heart = HEART.instantiate()
		add_child(heart)
	pass	


func update_health(current_health: int) -> void:
	var health = get_children()
	
	for index in range(current_health):
		health[index].update(true)
		
	for index in range(current_health, health.size()):
		health[index].update(false)		
	pass	
