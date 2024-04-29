extends CharacterBody2D
var direction
var active:bool = false
var speed:int = 100
var acceleration:int = 80
var speedup_time:float = 0
var explosion

func _ready() -> void:
	$PointLight2D.energy = 0
	pass
	
func _process(delta: float) -> void:
	direction = (Globals.player_pos - global_position).normalized()
	velocity = direction * (speed + acceleration * speedup_time)
	if active:
		look_at(Globals.player_pos)
		speedup_time = speedup_time + delta
		move_and_slide()
		print(speedup_time)
	if not active:
		speedup_time = 0
	
func hit():

	pass



func _on_active_area_body_entered(body):
	active = true
	pass # Replace with function body.


func _on_active_area_body_exited(body):
	active = false
	pass # Replace with function body.




func _on_readyto_boom_body_entered(body):
	$AnimationPlayer.play("blinking")
	$PointLight2D.energy = 0
	active = false
	await get_tree().create_timer(1.2).timeout
	$AnimationPlayer.play("explosion")
	print("ready to explode")
	await $AnimationPlayer.animation_finished
	queue_free()
	pass # Replace with function body.
