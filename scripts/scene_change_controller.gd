extends Node

var currentScene = null
@onready var GameNode =get_tree().root.get_node("Game")
@onready var currentLevelNode= GameNode.find_child("CurrentLevel")
@onready var player = GameNode.find_child("player")

func _ready():
	currentScene = currentLevelNode.get_child(0)
	
func changeScene(scenePath):
	print(scenePath)
	call_deferred("_defered_switch_scene", scenePath)
	
	
func _defered_switch_scene(scenePath):
	
	currentScene.queue_free()
	var loadNewScene = load(scenePath)
	var newScene= loadNewScene.instantiate()
	currentScene = newScene
	
	currentLevelNode.add_child(currentScene,true)

	#get_tree().current_scene = currentScene	
