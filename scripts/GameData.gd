extends Node

var main ={
	player={
		hp=3,
		maxHp=10,
		speedMultipliyer=1,
		isLocked=false,
		isDialogOpen=false
		
	},
	keyItems={
		leftLeg=false,
		rightLeg=false,
		leftArm=false,
		rightArm=false,
		
	},
	persistentData={
		"currentArea":"forest",
		"currentLevel":"level1",
		"currentSpawnPoint":"a"
	}
	
}

var items={
	keyItems={
		leftLeg={
			displayName="Left Leg",
			description="Your missing leg!",
			
		}
	}
}
var levels={
	"area":{
		"forest":{
			"level1":{
				"name":"level1",
				"scenePath":"res://scenes/level_1.tscn",
				"connections":{
					#key is the connection point entered. then area+level+connection is the point exited
					"a": {"area":"forest","level":"level2","connection":"b"}
				}
			
			},
			"level2":{
				"name":"level2",
				"scenePath":"res://scenes/level_2.tscn",
				"connections":{
					"a": {"area":"forest","level":"level1","connection":"a"}
				}
			}
		}
	}
}


