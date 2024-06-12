extends CharacterBody2D

var win_size : Vector2
var direction : Vector2
var speed : int
const START_SPEED = 500
const ACCEL = 50
const limit_point = 200


func _ready():
	win_size = get_viewport_rect().size

func new_ball():
	position.x = win_size.x /2
	position.y = randf_range(limit_point, win_size.y - limit_point)
	speed = START_SPEED
	direction = random_direction()
	
func random_direction():
	var new_dir := Vector2()
	new_dir.x = [-1,1].pick_random()
	new_dir.y = randf_range(-1,1)
	return new_dir

func _physics_process(delta):
	move_and_collide(speed*delta*direction)
