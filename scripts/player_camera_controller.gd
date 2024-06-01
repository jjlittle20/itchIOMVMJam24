extends Node

@onready var GameNode =get_tree().root.get_node("Game")
@onready var player = GameNode.find_child("player")

func setBoundries(left,right,top,bottom):
	var camera = player.find_child("Camera2D")
	camera.limit_left =left
	camera.limit_right=right
	camera.limit_top = top
	camera.limit_bottom = bottom
