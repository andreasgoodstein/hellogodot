extends Sprite

var move

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(_delta: float) -> void:
	var viewport_size = get_viewport().size
		
	match move:
		'up':
			if (position.y > 49):
				move_local_y(-10)
		'right':
			if (position.x < viewport_size.x - 49):
				move_local_x(10)
		'down':
			if (position.y < viewport_size.y - 49):
				move_local_y(10)
		'left':
			if (position.x > 49):
				move_local_x(-10)

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
