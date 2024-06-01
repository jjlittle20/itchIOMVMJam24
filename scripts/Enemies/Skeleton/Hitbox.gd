extends Area2D

func _on_body_entered(body):
	var enemyName = get_parent().name
	var hitDamage =GameData.enemies[enemyName].attackDamage
	body.takeDamage(hitDamage)
