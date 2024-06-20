extends Sprite2D

var scores := [0,0] # 0:Player 1:CPU
var PADEL_SPEED := 500

func _on_ball_timer_timeout():
	$Ball.new_ball()



func _on_score_left_body_entered(body):
	scores[1] += 1
	$Hud/CPUScore.text = str(scores[1])
	$BallTimer.start()


func _on_score_right_body_entered(body):
	scores[0] += 1
	$Hud/PlayerScore.text = str(scores[0])
	$BallTimer.start()
