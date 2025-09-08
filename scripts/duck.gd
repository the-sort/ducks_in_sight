extends CharacterBody2D

var res 
var dest : Vector2
var speed = 1000

func _ready() -> void:
	res =  get_viewport_rect().size
	dest = Vector2(randf_range(0, res.x), randf_range(0, res.y))

func _physics_process(_delta: float) -> void:
	velocity =  position.direction_to(dest) * speed
	if position.distance_to(dest) > 10:
		move_and_slide()
	else :
		dest = Vector2(randf_range(0, res.x), randf_range(0, res.y))
