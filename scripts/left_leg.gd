extends Area2D
@onready var game_data = %GameData
@onready var player = %player



func _on_body_entered(body):
	game_data.main.keyItems.leftLeg =true
#open diaog box with leg title and description
	player.showDialog(game_data.items.keyItems.leftLeg)
	queue_free()
