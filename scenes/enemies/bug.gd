extends CharacterBody2D
var player_nearby:bool = false
var bug_fireable:bool = false
var speed:int = 350
signal bug_laser_attack(pos,direction)
var bug_attack_cooldown:bool = true
@onready var bug_animation:AnimatedSprite2D = $AnimatedSprite2D
var close_range:int = 500


#Noticing Moving Attacking
func _process(delta):
	var in_range = Globals.player_pos.distance_to(global_position) < close_range
	if player_nearby and not in_range:
		Notice_player()
		var direction:Vector2 = (Globals.player_pos - global_position).normalized()
		position = position + direction * speed * delta
		bug_animation.play("walk")
		print('player_nearby=',player_nearby,'not_near_enough=',in_range)
	if bug_fireable:
		Notice_player()
		Attack_player()
	pass



func Notice_player():
	look_at(Globals.player_pos)
	pass

func Attack_player():
	if bug_attack_cooldown and bug_fireable:
		bug_attack_cooldown = false
		var pos = $LaserSpawnPositions/Marker2D.global_position
		var direction:Vector2 = (Globals.player_pos - $LaserSpawnPositions/Marker2D.global_position).normalized()
		bug_laser_attack.emit(pos,direction)
		$Timer/BugAttackTimer.start()
		bug_animation.play("attack")
	pass

func _on_notice_area_body_entered(_body):
	player_nearby = true
	pass # Replace with function body.


func _on_notice_area_body_exited(_body):
	player_nearby = false
	pass # Replace with function body.


func _on_attack_area_body_entered(_body):
	bug_fireable = true
	
	pass # Replace with function body.


func _on_attack_area_body_exited(_body):
	bug_fireable = false
	
	pass # Replace with function body.


func _on_bug_attack_timer_timeout() -> void:
	bug_attack_cooldown = true
	pass # Replace with function body.
