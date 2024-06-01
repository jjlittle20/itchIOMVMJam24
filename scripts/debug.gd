extends Label


func _ready():
	
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var persistantData =GameData.main.persistentData
	self.text =persistantData.currentLevel+"\n"+persistantData.currentSpawnPoint+"\n"+persistantData.currentArea
