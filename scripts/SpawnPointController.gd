extends Node

@onready var gameData = GameData



func _ready():
	var currentSpawnPoint = gameData.main.persistentData.currentSpawnPoint
	var children = get_children()
	for node in children:
		
		if node.name == currentSpawnPoint:
			GlobalPlayerController.setPlayerPosition(node.position.x,node.position.y)




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
