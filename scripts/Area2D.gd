extends Area2D


func _on_body_entered(body):
	print("ressurection")
	GameData.main.persistentData.currentLevel = "villageLevelB"
	GameData.main.persistentData.currentArea = "village"
	GameData.main.persistentData.currentSpawnPoint = "graveSpawn"
	var scenePath = "res://scenes/village_level_B.tscn"
	SceneChangeController.changeScene(scenePath)
	body.switchPlayerToSkeleton()

