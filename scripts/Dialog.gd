extends Label

@onready var game_data = GameData


# Called when the node enters the scene tree for the first time.
func _ready():
	
	self.hide()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(game_data != null and game_data.main.player.isDialogOpen): self.show()
	else:self.hide()
	
	

func setDialogText(dialog):
	self.text =dialog.description
