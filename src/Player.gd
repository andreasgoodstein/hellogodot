extends Sprite

var move
var moved_counter

# Called when the node enters the scene tree for the first time.
func _ready():
	moved_counter = get_parent().get_node('MovedCounter')	

func _process(_delta: float) -> void:
	var viewport_size = get_viewport().size
		
	match move:
		'up':
			if (position.y > 49):
				move_local_y(-10)
				increment_moved_count()
		'right':
			if (position.x < viewport_size.x - 49):
				move_local_x(10)
				increment_moved_count()
		'down':
			if (position.y < viewport_size.y - 49):
				move_local_y(10)
				increment_moved_count()
		'left':
			if (position.x > 49):
				move_local_x(-10)
				increment_moved_count()

func _input(event: InputEvent) -> void:
	move = ''
	
	if (event.is_action_pressed("ui_up")):
		move = 'up'
	if (event.is_action_pressed("ui_right")):
		move = 'right'
	if (event.is_action_pressed("ui_down")):
		move = 'down'
	if (event.is_action_pressed("ui_left")):
		move = 'left'	

func increment_moved_count() -> void:	
	var new_count = 'SP: ' + str(int(moved_counter.text) + 10)
	moved_counter.clear()
	moved_counter.add_text(new_count)
