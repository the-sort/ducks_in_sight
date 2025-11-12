extends Node

func _ready() -> void:
	$VBoxContainer/played_score.text = "Your score was: " + str(Score.score)

func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_scene.tscn")


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit(0)
