extends StaticBody2D

var win_height : int
var p_height:int
var move_by :int
var ball_position  : Vector2
var dist :int

func _ready():
	win_height = get_viewport_rect().size.y
	p_height = $ColorRect.get_size().y
	
func _physics_process(delta):
	dist =position.y - ball_position.y 
	
	if abs(dist) > get_parent().PADEL_SPEED * delta :
		move_by = get_parent().PADEL_SPEED * delta * sign(dist)
	else:
		move_by=dist
	
	position.y -= move_by
	position.y = clamp(position.y,p_height/2,win_height-(p_height/2))


func _on_ball_position_changed(new_value):
	ball_position = new_value
