extends Node

@onready var duck_scene = preload("res://scenes/duck.tscn")

var duck : Duck2D
var speed_multiplier : float = 1

@export var limit : int = 10

func _on_timeout() -> void:
	if get_child_count() == limit :
		return
	duck = duck_scene.instantiate()
	duck.speed *= speed_multiplier
	snappedf(duck.speed, 1)
	add_child(duck)
 

func _on_hud_speed_up() -> void:
	speed_multiplier *= 1.2
