extends Area2D


func _on_body_entered(_body):
	print("entered")
	var levelName =get_parent().name.rstrip("0123456789")
	var connectionPoint= self.name
	print(levelName,connectionPoint)
	print(GameData.levels.area[GameData.main.persistentData.currentArea])
	var connection = GameData.levels.area[GameData.main.persistentData.currentArea][levelName].connections[connectionPoint]
	var scenePath=GameData.levels.area[connection.area][connection.level].scenePath
	GameData.main.persistentData.currentLevel = connection.level
	GameData.main.persistentData.currentArea = connection.area
	GameData.main.persistentData.currentSpawnPoint = connection.connection
	print("from: "+levelName+" "+connectionPoint+" to: "+connection.level+" "+connection.connection)
	SceneChangeController.changeScene(scenePath)
