class_name HealtHud extends HBoxContainer

const HEART = preload("uid://bslevyetreva")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func set_max_health(max: int) -> void:
	max = max / 4
	for index in range(max):
		var heart = HEART.instantiate()
		add_child(heart)
	pass	


func update_health(current_health: int) -> void:
	var health = get_children()
	
	var full_hearts = current_health / 4
	
	
	for index in range(full_hearts):
		health[index].update(4)
		
	if full_hearts == health.size(): return	
	
	var remainder = current_health % 4
	health[full_hearts].update(remainder)
		
	for index in range(full_hearts + 1, health.size()):
		health[index].update(0)		
	pass	
