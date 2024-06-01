extends Area2D

signal exploded(node: Node2D)
signal pop_up_finished

@export var texture: Texture2D
@export var flip_texture: bool = false
@export var speed: int = 100
@export var direction_left_to_right: bool = false
@export var pizza_audio: AudioStream
@export var is_walking: bool = true
@export var score_on_hit: int = 1

var hit: bool = false

func _ready():
	$Pizza.hit_person_finished.connect(hit_person_finished)
	$CPUParticles2D.finished.connect(particles_finished)
	$AnimationPlayer.animation_finished.connect(pop_up_animation_finished)
	$Person.texture = texture
	$AudioStreamPlayerIntern.stream = pizza_audio
	$Pizza/Label.text = "+%s" % str(score_on_hit)
	if is_walking:
		$AnimationPlayer.play("walk")
	else:
		$CollisionPolygon2D.hide()

func _on_area_2d_input_event(_viewport, event, _shape_idx):
	_viewport.set_input_as_handled()
	if hit:
		return # can only be hit once

	if event is InputEventMouseButton:
		if event.button_index == 1 and event.pressed and GlobalState.ammo > 0:
			_viewport.set_input_as_handled()
			$Pizza.global_position = get_global_mouse_position()
			$Pizza/Label.show()
			hit = true
			$CollisionPolygon2D.visible = false
			GlobalState.increase_score(score_on_hit)
			$Pizza.hit_person()
			$AudioStreamPlayerIntern.play()


func hit_person_finished():
	$Person.visible = false
	$Pizza/Label.hide()
	$CPUParticles2D.emitting = true

func particles_finished():
	exploded.emit(self)
	
func reset(local_position_x):
	$Person.visible = true
	$CollisionPolygon2D.visible = true
	hit = false
	if local_position_x != null:
		position.x = local_position_x

func pop_up():
	$CollisionPolygon2D.show()
	$AnimationPlayer.play("pop_up")

func pop_up_animation_finished(_animation_name: String):
	reset(null)
	$CollisionPolygon2D.hide()
	pop_up_finished.emit()
