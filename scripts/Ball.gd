extends CharacterBody2D

var win_size : Vector2
var direction : Vector2
var speed : int
const START_SPEED = 500
const ACCEL = 50
const limit_point = 200
const MAX_Y_VECTOR:float = 0.6 

signal position_changed(new_value)


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

func new_direction(collider):
	var ball_y = position.y
	var pad_y = collider.position.y
	var dist = ball_y - pad_y
	var new_dir := Vector2()
	
	if direction.x > 0:
		new_dir.x = -1
	else:
		new_dir.x = 1
	new_dir.y = (dist/(collider.p_height/2)) * MAX_Y_VECTOR
	return new_dir.normalized()

func _physics_process(delta):
	var collision = move_and_collide(speed*delta*direction)
	var collider
	if collision:
		collider = collision.get_collider()
		if collider == $"../Player" or collider.name == "CPU" :
			speed += ACCEL
			direction = new_direction(collider)
		else:
			direction = direction.bounce(collision.get_normal())
			
			
	position_changed.emit(position)
