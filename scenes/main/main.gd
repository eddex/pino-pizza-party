extends Node2D

var level: PackedScene = preload("res://scenes/test_level_1/test_level_1.tscn")
var level_instance: Node2D


func _ready():
	$UI/HUD/Timer.timeout.connect(timer_timeout)


func timer_timeout():
	$UI/GameOver.visible = true
	$UI/GameOver/Panel/VBoxContainer/ScoreLabel.text = "SCORE: %s" % GlobalState.score
	if GlobalState.high_score == GlobalState.score:
		$UI/GameOver/Panel/VBoxContainer/NewHighScoreLabel.show()
	else:
		$UI/GameOver/Panel/VBoxContainer/NewHighScoreLabel.hide()
	level_instance.queue_free()


func _on_button_play_pressed():
	var instance = level.instantiate()
	level_instance = instance
	GlobalState.score = 0
	$UI/Menu.hide()
	$UI/Settings.hide()
	$UI/GameOver.hide()
	$UI/HUD.show()
	$UI/HUD/Timer.start()
	add_child(level_instance)


func _on_button_play_again_pressed():
	_on_button_play_pressed()


func _on_button_main_menu_pressed():
	$UI/GameOver.hide()
	$UI/HUD.hide()
	$UI/Menu.show()
	%HighScoreLabel.text = "[center][wave]High Score: %s[/wave][/center]" % str(GlobalState.high_score)
