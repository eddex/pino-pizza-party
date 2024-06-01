extends Node2D


func _unhandled_input(event: InputEvent):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT and event.pressed:
			GlobalState.reload()
			$ReloadAudioStreamPlayer.play()
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if GlobalState.ammo > 0:
				$ThrowAudioStreamPlayer.play()
				GlobalState.shot.emit()
			else:
				$EmptyAudioStreamPlayer.play()

