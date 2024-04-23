extends CharacterBody2D

var player_nearby:bool = false
var can_laser:bool = true
var right_gun_shoot:bool = false
var can_damaged:bool = true

var health:int = 30

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
			$Node/LaserCoolDown.start()
			
func hit():
	if can_damaged:
		health -= 10
		print('scout was hit')
		$Sprite2D.material.set_shader_parameter("progress",1)
		$Node/ScoutDamagedCooldown.start()
		can_damaged = false
	if health <= 0:
		queue_free()
	


func _on_attackarea_body_entered(_body):
	player_nearby = true
	pass # Replace with function body.


func _on_attackarea_body_exited(_body):
	player_nearby = false
	pass # Replace with function body.
	
func _on_laser_cool_down_timeout():
	can_laser = true
	pass # Replace with function body.


func _on_scout_damaged_cooldown_timeout() -> void:
	can_damaged = true
	$Sprite2D.material.set_shader_parameter("progress",0)
	pass # Replace with function body.
