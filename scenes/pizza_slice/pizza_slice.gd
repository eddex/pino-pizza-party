extends Node2D

signal hit_person_finished

func _ready():
	visible = false
	$AnimationPlayer.animation_finished.connect(animation_finished)

func hit_person():
	visible = true
	$CPUParticles2D.emitting = true
	$AnimationPlayer.play("hit_person")

func animation_finished(_animation_name: String):
	hit_person_finished.emit()
