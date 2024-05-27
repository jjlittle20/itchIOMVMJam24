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
		"currentLevel":"forest_level_1",
		"currentSpawnPoint":""
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
			"forest_level_1":{
				"name":"forest_level_1",
				"scenePath":"res://scenes/forest_level_1.tscn",
				"connections":{
					#key is the connection point entered. then area+level+connection is the point exited
					"b": {"area":"forest","level":"forest_level_2","connection":"a"}
				}
			
			},
			"forest_level_2":{
				"name":"forest_level_2",
				"scenePath":"res://scenes/forest_level_2.tscn",
				"connections":{
					"a": {"area":"forest","level":"forest_level_1","connection":"b"},
					"b": {"area":"forest","level":"forest_level_3","connection":"a"}
				}
			},
			"forest_level_3":{
				"name":"forest_level_3",
				"scenePath":"res://scenes/forest_level_3.tscn",
				"connections":{
					"a": {"area":"forest","level":"forest_level_2","connection":"b"},
					"b": {"area":"forest","level":"forest_level_4","connection":"a"}
				}
			},
			"forest_level_4":{
				"name":"forest_level_4",
				"scenePath":"res://scenes/forest_level_4.tscn",
				"connections":{
					"a": {"area":"forest","level":"forest_level_3","connection":"b"},
					#"b": {"area":"forest","level":"forest_level_4","connection":"a"}
				}
			}
		}
	}
}


