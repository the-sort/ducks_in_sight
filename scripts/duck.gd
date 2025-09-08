extends CharacterBody2D

var res 
var dest : Vector2
var speed = 1000

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
		
	elif direction.x > 0 :
		$duck_animated.flip_h = true
	
	#if direction.y < 0 && $duck_animated.rotation_degrees != 45:
		#$duck_animated.ro
