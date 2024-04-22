extends RigidBody2D

const speed = 750
var explosion_active:bool = false

func explode():
	$AnimationPlayer.play("explosion")
	explosion_active = true
	pass
	
func _process(_delta):
	if explosion_active == true:
		var targets = get_tree().get_nodes_in_group("container")
		for target in targets:
			if "hit" in target:
				target.hit()
