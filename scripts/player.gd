extends CharacterBody2D


@onready var human_animated_sprite = $humanAnimatedSprite
@onready var skeleton_animated_sprite = $skeletonAnimatedSprite
@onready var standing_collision_shape = $standingCollisionShape
@onready var crawling_collision_shape = $crawlingCollisionShape
@onready var respawn_timer = $respawnTimer

const SPEED = 180.0
const JUMP_VELOCITY = -300.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
enum direction{LEFT =-1 ,RIGHT=1}
enum state {IDLE,RUNNING,DIEING,JUMPING}
var currentDirection =direction.RIGHT
var currentState = state.IDLE
var currentSprite = human_animated_sprite
var currentCollsionShape = standing_collision_shape


func _ready():
	if(!GameData.main.player.isHuman):
		currentSprite = skeleton_animated_sprite
		currentCollsionShape=crawling_collision_shape
		switchPlayerToSkeleton()
	else:
		currentSprite = human_animated_sprite
		currentCollsionShape = standing_collision_shape

func _physics_process(delta):
	if(GameData.main.player.isLocked):return

	var currentDirection = Input.get_axis("move_left", "move_right")
	if currentDirection == direction.RIGHT:
		currentSprite.flip_h = false
	elif currentDirection == direction.LEFT:
		currentSprite.flip_h = true
	if not is_on_floor():velocity.y += gravity * delta

	var canJump = GameData.main.player.canJump
	if  canJump and Input.is_action_just_pressed("jump") and is_on_floor():
		player_jump(1)
	if is_on_floor():
		if currentDirection == 0:
			currentSprite.play("idle")
		else: currentSprite.play("run")
	else: currentSprite.play("jump")
		
	velocity.x = currentDirection * SPEED 
	move_and_slide()
	
	
func player_jump(multiplier):
	velocity.y = JUMP_VELOCITY* multiplier
	
func setPosition(x,y):
	position.x =x
	position.y=y

func switchPlayerToSkeleton():
	GameData.main.player.isHuman =false
	GameData.main.player.canJump =false
	currentSprite = skeleton_animated_sprite
	human_animated_sprite.hide()
	skeleton_animated_sprite.show()
	currentCollsionShape =crawling_collision_shape
	crawling_collision_shape.set_deferred("disabled", false)
	standing_collision_shape.set_deferred("disabled", true)

func takeDamage(damageTaken):
	var updatedPlayerHp =GameData.main.player.currentHp -damageTaken
	GameData.main.player.currentHp =  updatedPlayerHp
	if(updatedPlayerHp <= 0):
		respawn_timer.start()
		print(currentCollsionShape)
		currentCollsionShape.set_deferred("disabled", true)
		GameData.main.player.isLocked =true
		currentSprite.play("die")
		
		
func _on_respawn_timer_timeout():
	respawn()		
		
func respawn():
	var level = GameData.main.persistentData.lastCheckPoint.level 
	var spawn = GameData.main.persistentData.lastCheckPoint.checkPointName
	var area = GameData.main.persistentData.lastCheckPoint.area
	
	GameData.main.persistentData.currentLevel = level
	GameData.main.persistentData.currentArea = area
	GameData.main.persistentData.currentSpawnPoint = spawn
	
	
	var scenePath = GameData.levels.area[area][level].scenePath
	SceneChangeController.changeScene(scenePath)
	GameData.main.player.currentHp = GameData.main.player.fullHp
	GameData.main.player.isLocked =false
	currentCollsionShape.set_deferred("disabled", false)

func knockback(knockbackDirection):
	var dir =position - position
	velocity.y =-200
	velocity.x = -1000
	move_and_slide()








	
	
