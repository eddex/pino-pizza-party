@tool
extends Sprite2D


func _ready():
	texture = get_parent().texture
	flip_h = get_parent().flip_texture
