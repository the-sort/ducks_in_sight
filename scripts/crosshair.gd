extends CharacterBody2D

const speed : int = 1000
var dest : Vector2
var in_sight : Dictionary[int , Node2D]


func _ready() -> void:
	dest = position

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("l_click"):
		#print("l_click")
		dest = get_global_mouse_position()
	
	if event.is_action_pressed("shot"):
		#print("spacebar")
		for key in in_sight :
			in_sight[key].queue_free()

func _physics_process(_delta: float) -> void:
	velocity = Vector2.ZERO
	if position.distance_to(dest) > 10 :
		velocity = position.direction_to(dest) * speed
		move_and_slide()

func _on_hitbox_body_entered(body: Node2D) -> void:
	in_sight.set(body.get_instance_id(), body)

func _on_hitbox_body_exited(body: Node2D) -> void:
	in_sight.erase(body.get_instance_id())
