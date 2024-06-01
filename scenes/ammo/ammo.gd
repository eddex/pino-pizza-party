extends Node2D

@export var ammo_sprites: Array[Sprite2D]

func _ready():
	GlobalState.reload()
	GlobalState.shot.connect(shot_fired)
	GlobalState.reloaded.connect(reloaded)

func shot_fired():
	GlobalState.ammo -= 1
	update_sprite()

func reloaded():
	update_sprite()
	
func update_sprite():
	for i in range(ammo_sprites.size()):
		if i == GlobalState.ammo:
			ammo_sprites[i].show()
		else:
			ammo_sprites[i].hide()
