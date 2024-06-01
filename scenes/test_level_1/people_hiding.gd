extends Node2D

@export var people: Array[Node2D]

var index: int = 0

func _ready():
	for person in people:
		person.pop_up_finished.connect(pop_up_finished)
	show_next_person()

func pop_up_finished():
	show_next_person()

func show_next_person():
	index = (index + 1) % people.size()
	people[index].pop_up()
