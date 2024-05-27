extends Node
@onready var GameNode =get_tree().root.get_node("Game")
@onready var player = GameNode.find_child("player")

func setPlayerPosition(newPlayerPosX,newPlayerPosY):
	player.setPosition(newPlayerPosX,newPlayerPosY)
	

