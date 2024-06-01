extends Node

var main ={
	player={
		currentHp=3,
		fullHp =3,
		maxHp=10,
		speedMultipliyer=1,
		isLocked=false,
		isDialogOpen=false,
		canJump=true,
		isHuman=true
		
		
	},
	keyItems={
		leftLeg=false,
		rightLeg=false,
		leftArm=false,
		rightArm=false,
		
	},
	persistentData={
		"currentArea":"village",
		"currentLevel":"villageLevelA",
		"currentSpawnPoint":"villageLevelAStartSpawn",
		"lastCheckPoint":{
			"area":"village",
			"level":"villageLevelA",
			"checkPointName":"villageLevelAStartSpawn"
			
		}
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

var enemies={
	"Skeleton":{
		"hp":5,
		"attackDamage":0.5,
		
	}
}
var levels={
	"area":{
		"village":{
			"villageLevelA":{
				"name":"villageLevelA",
				"scenePath":"res://scenes/village_level_A.tscn",
				"connections":{
					#key is the connection point entered. then area+level+connection is the point exited
					"villageLevelARightExit": {"area":"village","level":"villageLevelB","connection":"villageLevelBLeftSpawn"}
				},
			
			},
			"villageLevelB":{
				"name":"villageLevelB",
				"scenePath":"res://scenes/village_level_B.tscn",
				"connections":{
					"villageLevelBLeftExit": {"area":"village","level":"villageLevelA","connection":"villageLevelARightSpawn"},
					"villageLevelBRightExit": {"area":"mageTower","level":"mageTowerLevelA","connection":"mageTowerLevelALeftSpawn"}
				}
			},
			
		},
		"mageTower":{
			"mageTowerLevelA":{
				"name":"mageTowerLevelA",
				"scenePath":"res://scenes/mage_tower_level_A.tscn",
				"connections":{
					"mageTowerLevelALeftExit": {"area":"village","level":"villageLevelB","connection":"villageLevelBRightSpawn"},
					"mageTowerLevelATopExit": {"area":"mageTower","level":"mageTowerLevelB","connection":"mageTowerLevelBBottomSpawn"}
				}
			},
			"mageTowerLevelB":{
				"name":"mageTowerLevelB",
				"scenePath":"res://scenes/mage_tower_level_B.tscn",
				"connections":{
					"mageTowerLevelBBottomExit": {"area":"mageTower","level":"mageTowerLevelA","connection":"mageTowerLevelATopSpawn"},
					"mageTowerLevelBRightExit": {"area":"mageTower","level":"mageTowerBossRoom","connection":"mageTowerBossRoomLeftSpawn"}
				}
			},
			"mageTowerBossRoom":{
				"name":"mageTowerBossRoom",
				"scenePath":"res://scenes/mage_tower_boss_room.tscn",
				"connections":{
					"mageTowerBossRoomLeftExit": {"area":"mageTower","level":"mageTowerLevelB","connection":"mageTowerLevelBRightSpawn"},
				}
			},
		}
	}
}


