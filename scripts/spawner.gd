extends Node

@onready var duck_scene = preload("res://scenes/duck.tscn")



func _on_timeout() -> void:
	add_child(duck_scene.instantiate())
 
