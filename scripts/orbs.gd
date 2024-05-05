extends Node

var score = 0
@onready var orb = $orb
@onready var label = $score_label

func increase_score():
	score += 1
	if score == 1:
		label.text = str(score) + " Orb"
	else:
		label.text = str(score) + " Orbs"
