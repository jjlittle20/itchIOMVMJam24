extends Area2D

func _on_body_entered(body):
	if(body.is_on_floor()):
		body.player_jump(1)
