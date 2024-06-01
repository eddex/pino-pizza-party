extends Control


func _process(_delta):
	$TimerLabel.text = "Time left: %s" % str(floor($Timer.time_left))
	$ScoreLabel.text = "Score: %s" % str(GlobalState.score)
	if GlobalState.ammo <= 0:
		$ReloadLabel.show()
	else:
		$ReloadLabel.hide()
