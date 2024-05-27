extends Area2D


func _on_body_entered(_body):
	var levelName =get_parent().name
	var connectionPoint= self.name
	var connection = GameData.levels.area[GameData.main.persistentData.currentArea][levelName].connections[connectionPoint]
	var scenePath=GameData.levels.area[connection.area][connection.level].scenePath
	SceneChangeController.changeScene(scenePath,connection.level)
	GameData.main.persistentData.currentLevel = levelName
	GameData.main.persistentData.currentSpawnPoint = connection.connection
