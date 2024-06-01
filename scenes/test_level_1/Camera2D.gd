extends Camera2D

const MOVE_RIGHT: int = 1
const MOVE_LEFT: int = -1
const camera_speed: int = 500

var move: bool = false
var move_direction: int = MOVE_RIGHT

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if move:
		position.x += camera_speed * move_direction * delta


func _on_move_left_area_mouse_entered():
	move_direction = MOVE_LEFT
	move = true


func _on_move_left_area_mouse_exited():
	move = false


func _on_move_right_area_mouse_entered():
	move_direction = MOVE_RIGHT
	move = true


func _on_move_right_area_mouse_exited():
	move = false
