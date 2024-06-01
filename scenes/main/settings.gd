extends Panel

func _ready():
	%VolumeHSlider.value = db_to_linear(AudioServer.get_bus_volume_db(0)) * 100


func _on_volume_h_slider_value_changed(value):
	AudioServer.set_bus_volume_db(0, linear_to_db(value / 100))


func _on_button_pressed():
	visible = false


func _on_button_settings_pressed():
	visible = true
