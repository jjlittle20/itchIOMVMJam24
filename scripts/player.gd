extends CharacterBody2D

@onready var game_data = GameData
#@onready var dialogNode = $Dialog



const SPEED = 180.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	#if(game_data.main.player.isDialogOpen and Input.is_action_just_pressed("interact")): closeDialog()
	if(game_data.main.player.isLocked):return
	# Add the gravity.
	if not is_on_floor():velocity.y += gravity * delta

	# Handle jump.
	var canJump = game_data.main.keyItems.leftLeg
	if  canJump and Input.is_action_just_pressed("jump") and is_on_floor():
		player_jump(1)
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	
func player_jump(multiplier):
	velocity.y = JUMP_VELOCITY* multiplier
	
#func showDialog(dialog):
	#dialogNode.setDialogText(dialog)
	#game_data.main.player.isLocked =true
	#game_data.main.player.isDialogOpen=true
#
#
#func closeDialog():
	#game_data.main.player.isLocked =false
	#game_data.main.player.isDialogOpen=false
	
func setPosition(x,y):
	position.x =x
	position.y=y
