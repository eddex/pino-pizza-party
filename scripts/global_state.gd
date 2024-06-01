extends Node

signal shot
signal reloaded

var high_score: int = 0
var score: int = 0
var ammo: int = 8

func increase_score(score_increase: int):
	score += score_increase
	if score > high_score:
		high_score = score

func reload():
	ammo = 8
	reloaded.emit()
