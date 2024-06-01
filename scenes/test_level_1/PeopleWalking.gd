extends Node2D

@export var left_to_right: bool = false

var people: Array[Node2D] = []

func _ready():
	for child in get_children().slice(2): # skip the 2 spawn points
		child.exploded.connect(reset_person)
		people.append(child as Node2D)

func _process(delta):
	for person in people:
		if !person.hit:
			var pos_delta = delta * person.speed
			var direction = 1 if person.direction_left_to_right else -1
			person.position.x += pos_delta * direction
			if is_out_of_bounds(person):
				reset_person(person)
			
func is_out_of_bounds(node: Node2D) -> bool:
	var limit_point: Marker2D = $SpawnPointR if node.direction_left_to_right else $SpawnPointL
	if node.direction_left_to_right:
		return node.position.x > limit_point.position.x
	else:
		return node.position.x < limit_point.position.x

func reset_person(node: Node2D):
	var spawn_point: Marker2D = $SpawnPointL if node.direction_left_to_right else $SpawnPointR
	node.reset(spawn_point.position.x)
