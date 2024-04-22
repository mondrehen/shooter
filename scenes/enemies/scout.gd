extends CharacterBody2D

var player_nearby:bool = false
var can_laser:bool = true
var right_gun_shoot:bool = false

signal laser(pos,direction)

func _process(_delta):
	if player_nearby == true:
		look_at(Globals.player_pos)
		if can_laser:
			var Shootpoint = $LaserSpawnPositions.get_child(right_gun_shoot)
			right_gun_shoot = not right_gun_shoot
			var pos:Vector2 = Shootpoint.global_position
			var direction:Vector2 = (Globals.player_pos - position).normalized()
			laser.emit(pos,direction)
			can_laser = false
			$LaserCoolDown.start()


func _on_attackarea_body_entered(_body):
	player_nearby = true
	pass # Replace with function body.


func _on_attackarea_body_exited(_body):
	player_nearby = false
	pass # Replace with function body.
	
func _on_laser_cool_down_timeout():
	can_laser = true
	pass # Replace with function body.