extends Node2D

@export var people: Array[Node2D]
@export var spawn_points: Array[Marker2D]

var current_person: int = 0
var current_spawn: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	for person in people:
		person.pop_up_finished.connect(pop_up_finished)
	show_next_person()

func pop_up_finished():
	show_next_person()

func show_next_person():
	var person_to_spawn: Node2D = people[current_person]
	current_person = (current_person + 1) % people.size()
	person_to_spawn.reparent(spawn_points[current_spawn])
	current_spawn = (current_spawn + 1) % spawn_points.size()
	person_to_spawn.pop_up()
