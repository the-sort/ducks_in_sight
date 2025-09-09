extends CharacterBody2D

var res 
var dest : Vector2
const speed = 1000

func _ready() -> void:
	res =  get_viewport_rect().size

func _physics_process(_delta: float) -> void:
	velocity =  position.direction_to(dest) * speed

	if position.distance_to(dest) < 10:
		dest = Vector2(randf_range(0, res.x), randf_range(0, res.y))
		face_to(position.direction_to(dest))
		$duck_animated.play("flight")
	else :
		move_and_slide()

func face_to(direction : Vector2) ->void:
	if direction.x < 0 :
		$duck_animated.flip_h = false
		set_angle(direction, -1)
		
	elif direction.x > 0 :
		$duck_animated.flip_h = true
		set_angle(direction, 1)


func set_angle(direction : Vector2, flip : int = 1) -> void :
	if (flip != 1 && flip != -1):
		push_error("Invalid flip value, set flip value to -1 when object horizontaly fliped")
		return
		
	var angle : float = snappedf( direction.y / 0.022, 1)  * flip
	if direction.y < 0 :
		$duck_animated.rotation_degrees = angle 
		
	if direction.y > 0 :
		$duck_animated.rotation_degrees = angle 
