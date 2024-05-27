extends Area2D


func _on_body_entered(_body):
	print("triggered")
	var levelName =get_parent().name
	var connectionPoint= self.name
	var connection = GameData.levels.area[GameData.main.persistentData.currentArea][levelName].connections[connectionPoint]
	var scenePath=GameData.levels.area[connection.area][connection.level].scenePath
	GameData.main.persistentData.currentLevel = connection.level
	GameData.main.persistentData.currentSpawnPoint = connection.connection
	print("from: "+levelName+" "+connectionPoint+" to: "+connection.level+" "+connection.connection)
	SceneChangeController.changeScene(scenePath)
