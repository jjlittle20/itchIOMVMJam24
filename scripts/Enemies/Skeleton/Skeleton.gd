extends CharacterBody2D

@onready var patrol_timer = $PatrolTimer

const SPEED = 90

var rng = RandomNumberGenerator.new()

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

enum state {PATROL, FOLLOW,RETURN,SLEEP}
enum directionEnum{LEFT=-1, RIGHT=1}
var currentDirection =directionEnum.RIGHT
var currentState = state.PATROL
var startPos=null

var target = null

func _ready():
	startPos =position
	
func _physics_process(delta):
	if not is_on_floor():velocity.y += gravity * delta

	if(currentState == state.PATROL):
		patrol()
	if(currentState== state.FOLLOW):
		follow()
	if(currentState == state.RETURN):
		
		if(int(velocity.x) ==0):
			currentState = state.PATROL
		returnToStartPos()

func patrol():
	velocity.x = currentDirection*SPEED
	move_and_slide()

func follow():
	if(target !=null):
		var direction = (target.position - position).normalized()
		velocity.x = direction.x*SPEED
	else: currentState = state.RETURN
	move_and_slide()

func returnToStartPos():
	var direction = (startPos - position).normalized()
	velocity.x = direction.x*SPEED
	move_and_slide()
	
func startPatrolTimer():
	var timerSeconds = rng.randf_range(0.0, 4.0)
	patrol_timer.wait_time = timerSeconds
	patrol_timer.start
	
func _on_patrol_timer_timeout():
	
	var newDirection =directionEnum.keys()[randi() % directionEnum.size()]

	currentDirection = directionEnum[newDirection]
	startPatrolTimer()
	


func _on_player_in_range_body_entered(body):
	target =body
	currentState = state.FOLLOW
	


func _on_player_in_range_body_exited(body):
	target = null
	currentState = state.RETURN


func _on_touch_hitbox_body_entered(body):
	body.knockback(currentDirection)
	
func knockback(knockbackDirection):
	var dir =position - position
	velocity.y =-200
	velocity.x = -1000
	move_and_slide()
