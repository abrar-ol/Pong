extends StaticBody2D

var p_height:int
var win_height:int

func _ready():
	p_height = $ColorRect.get_size().y
	win_height = get_viewport_rect().size.y
	
func _process(delta):
	if Input.is_action_pressed("ui_down"):
		position.y += get_parent().PADEL_SPEED * delta
	if Input.is_action_pressed("ui_up"):
		position.y -= get_parent().PADEL_SPEED * delta
		
	position.y = clamp(position.y,p_height/2,win_height-(p_height/2))
