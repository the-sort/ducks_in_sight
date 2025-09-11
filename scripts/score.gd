extends Node

@onready var score_i : int = 0
@onready var ammo = 10


func _ready() -> void:
	$score.text = "Score : " + str(score_i)
	$ammo.text =  "Ammo : " + str(ammo)


func _on_crosshair_shot(total: int) -> void:
	if total == 0 :
		ammo -= 1
		$ammo.text =  "Ammo : " + str(ammo)
		return
	score_i += total
	$score.text = "Score : " + str(score_i)
