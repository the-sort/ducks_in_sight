extends Node

@onready var duck_scene = preload("res://scenes/duck.tscn")
@export var limit : int = 10


func _on_timeout() -> void:
	if get_child_count() == limit :
		return
	add_child(duck_scene.instantiate())
 
