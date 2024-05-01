extends CharacterBody2D
var direction
var active:bool = false
var speed:int = 100
var acceleration:int = 80
var speedup_time:float = 0
var explosion_range:int = 400
var speed_multiplier:int = 1
var vulnerable:bool = true
var health:int = 30
var explosion_active:bool = false
var ondeathstoprotate:bool = false


func _ready() -> void:
	$explosion.hide()
	$PointLight2D.energy = 0
	pass
	
func _process(delta: float) -> void:
	direction = (Globals.player_pos - global_position).normalized()
	velocity = direction * (speed + acceleration * speedup_time) * speed_multiplier
	if active:
		if not ondeathstoprotate:
			look_at(Globals.player_pos)
		speedup_time = speedup_time + delta
		var collision = move_and_collide(velocity * delta)
		if collision:
			$AnimationPlayer.play("blinking")
			#explode() via AnimationPlayer
			
	if not active:
		speedup_time = 0
		
	if explosion_active == true:
		var targets = get_tree().get_nodes_in_group("Entity") + get_tree().get_nodes_in_group("container")
		for target in targets:
			var in_range = target.global_position.distance_to(global_position) < explosion_range
			if "hit" in target and in_range:
				target.hit()

func stop_movement():
	speed_multiplier = 0
	ondeathstoprotate = true
	pass
	
func explode():
	explosion_active = true
	$AnimationPlayer.play("explosion")
	stop_movement()

			
	
func hit():
	if vulnerable == true:
		health -= 10
		vulnerable = false
		$VulnerableTimer.start()
		$Drone.material.set_shader_parameter("progress",1)
	if health <= 0:
		explode()
	pass



func _on_active_area_body_entered(body):
	active = true
	pass # Replace with function body.


func _on_active_area_body_exited(body):
	active = false
	pass # Replace with function body.




#func _on_readyto_boom_body_entered(body):
#	$AnimationPlayer.play("blinking")
#	stopandboom = true
#	$PointLight2D.energy = 0
#	await get_tree().create_timer(1.2).timeout
#	$AnimationPlayer.play("explosion")
#	pass # Replace with function body.


func _on_vulnerable_timer_timeout():
	vulnerable = true
	$Drone.material.set_shader_parameter("progress",0)
	pass # Replace with function body.
