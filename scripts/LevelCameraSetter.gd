extends Node
#add this node as child of level tilemap
func _ready():
	var tileMap =get_parent()
	var map_limits = tileMap.get_used_rect()
	var map_cellsize = tileMap.tile_set.tile_size
	var limitLeft  = map_limits.position.x * map_cellsize.x
	var limitRight = map_limits.end.x * map_cellsize.x
	var limitTop = map_limits.position.y * map_cellsize.y
	var limitBottom = map_limits.end.y * map_cellsize.y
	PlayerCameraController.setBoundries(limitLeft,limitRight,limitTop,limitBottom)
