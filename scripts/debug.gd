extends Label


func _ready():
	
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text =GameData.main.persistentData.currentLevel+" "+GameData.main.persistentData.currentSpawnPoint
