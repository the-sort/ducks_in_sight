extends Node

@onready var save_path : String = "user://savegame.tres"
@onready var score_i : int = 0
@onready var score_b : int = 0
@onready var ammo : int = 5
@onready var loaded : CSavable
@onready var save : CSavable = CSavable.new()

signal speed_up

func _ready() -> void:
	$HBoxContainer/VBoxContainer/score.text = "Score : " + str(score_i)
	$ammo.text =  "Ammo : " + str(ammo)
	load_best_score()

func _process(_delta: float) -> void:
	$stop_watch.value = $stop_watch/timer.time_left


func _on_crosshair_shot(total_score : int, total_time : int ) -> void: #need to connect to signal
	if total_score == 0 :
		ammo -= 1
		if ammo == 0 :
			get_tree().change_scene_to_file("res://scenes/game_over.tscn")
		$ammo.text =  "Ammo : " + str(ammo)
		return
	
	score_i += total_score
	add_time(total_time)
	$HBoxContainer/VBoxContainer/score.text = "Score : " + str(score_i)
	
	if score_i != 0 && score_i % 50 == 0 :
		speed_up.emit()

func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	
func add_time(to_add : int) -> void :
	$stop_watch/timer.wait_time = $stop_watch/timer.time_left + to_add
	$stop_watch/timer.start()

func _exit_tree() -> void:
	save.best_score = score_i if score_i > score_b else score_b
	ResourceSaver.save(save, save_path)
	
func load_best_score() -> void:
	if !ResourceLoader.exists(save_path) :
		$HBoxContainer/VBoxContainer/best_score.text = "Best score : NaN" 
		return 
	loaded = ResourceLoader.load(save_path)
	score_b = loaded.best_score
	$HBoxContainer/VBoxContainer/best_score.text = "Best score : " + str(score_b)
