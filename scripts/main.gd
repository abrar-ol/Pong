extends Sprite2D

var scores := [0,0]
var PADEL_SPEED := 500



func _on_ball_timer_timeout():
	print("start the game")
	$Ball.new_ball()
