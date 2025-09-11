extends Node

@onready var score_i : int = 0
@onready var ammo = 5


func _ready() -> void:
	$score.text = "Score : " + str(score_i)
	$ammo.text =  "Ammo : " + str(ammo)


func _on_crosshair_shot(total: int) -> void: #need to connect to signal
	if total == 0 :
		ammo -= 1
		if ammo == 0 :
			get_tree().change_scene_to_file("res://scenes/game_over.tscn")
		$ammo.text =  "Ammo : " + str(ammo)
		return
	score_i += total
	$score.text = "Score : " + str(score_i)
