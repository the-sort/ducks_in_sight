extends CharacterBody2D

const speed : int = 1000
var dest : Vector2

func _input(event: InputEvent) -> void:
	if MOUSE_BUTTON_LEFT && event.is_pressed():
		dest = get_global_mouse_position()

func _physics_process(_delta: float) -> void:
	velocity = Vector2.ZERO
	if position.distance_to(dest) > 10 :
		velocity = position.direction_to(dest) * speed
	move_and_slide()
	pass
