extends CharacterBody2D
var player_nearby:bool = false
var bug_fireable:bool = false
var speed:int = 350
signal bug_laser_attack(pos,direction)
var bug_attack_cooldown:bool = true
@onready var bug_animation:AnimatedSprite2D = $AnimatedSprite2D
#var close_range:int = 500
var vulnerable:bool = true
var health:int = 20



#Noticing Moving Attacking
func _process(_delta):
#	var in_range = Globals.player_pos.distance_to(global_position) < close_range
	var direction:Vector2 = (Globals.player_pos - global_position).normalized()
	velocity = speed * direction
	print('player_nearby=',player_nearby,' bug fireable=',bug_fireable)
	if player_nearby:
		Notice_player()
		move_and_slide()
#		position = position + direction * speed * delta
	if bug_fireable:
		Notice_player()
#		Attack_player()
	pass

func hit():
	if vulnerable:
		health -=10
		$AnimatedSprite2D.material.set_shader_parameter('progress',1)
		vulnerable = false
		$Timer/VulnerableTimer.start()
		print("bug was hit")
	if health <= 0:
		queue_free()
	pass

func Notice_player():
	look_at(Globals.player_pos)
	pass

#func Attack_player():
#	if bug_attack_cooldown and bug_fireable:
#		bug_attack_cooldown = false
#		var _pos = $LaserSpawnPositions/Marker2D.global_position
#		var _direction:Vector2 = (Globals.player_pos - $LaserSpawnPositions/Marker2D.global_position).normalized()
##		bug_laser_attack.emit(pos,direction)
#		$Timer/BugAttackTimer.start()
#
#	pass

func _on_notice_area_body_entered(_body):
	bug_animation.play("walk")
	player_nearby = true
	pass # Replace with function body.


func _on_notice_area_body_exited(_body):
	bug_animation.stop()
	player_nearby = false
	pass # Replace with function body.


func _on_attack_area_body_entered(_body):
	bug_fireable = true
	bug_animation.play("attack")
	
	pass # Replace with function body.


func _on_attack_area_body_exited(_body):
	bug_fireable = false
	
	pass # Replace with function body.


func _on_bug_laser_attack_timer_timeout() -> void:
	bug_attack_cooldown = true
	pass # Replace with function body.


func _on_vulnerable_timer_timeout():
	vulnerable = true
	$AnimatedSprite2D.material.set_shader_parameter('progress',0)
	pass # Replace with function body.


func _on_animated_sprite_2d_animation_finished():
	if bug_fireable:
		Globals.health -= 10
		$Timer/BugMeleeTimer.start()
	pass # Replace with function body.


func _on_bug_melee_timer_timeout():
	$AnimatedSprite2D.play("attack")
	pass # Replace with function body.
