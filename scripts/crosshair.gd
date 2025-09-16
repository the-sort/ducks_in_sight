extends CharacterBody2D

const speed : int = 1000

var dest : Vector2
var in_sight : Dictionary[ int , Node2D ]
var total_score
var total_time

signal shot( total_score : int, total_time : int )


func _ready() -> void:
	dest = position

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("l_click"):
		dest = get_global_mouse_position()
	
	if event.is_action_pressed("shot"):
		total_score = 0
		total_time = 0
		for key in in_sight :
			total_score += in_sight[key].value  #every object that can be detected in sight needs to have value assigned
			total_time += in_sight[key].time #every object that can be detected in sight needs to have time assigned
			in_sight[key].queue_free()
		shot.emit(total_score, total_time)

func _physics_process(_delta: float) -> void:
	velocity = Vector2.ZERO
	if position.distance_to(dest) > 10 :
		velocity = position.direction_to(dest) * speed
		move_and_slide()

func _on_hitbox_body_entered(body: Node2D) -> void:
	in_sight.set(body.get_instance_id(), body)

func _on_hitbox_body_exited(body: Node2D) -> void:
	in_sight.erase(body.get_instance_id())
