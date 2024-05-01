extends CharacterBody2D
var active:bool = false
var speed:int = 200

func _ready() -> void:
	$NavigationAgent2D.target_position = Globals.player_pos


func _physics_process(delta: float) -> void:
	if active:
		var next_path_pos:Vector2 = $NavigationAgent2D.get_next_path_position()
		var direction:Vector2 = (next_path_pos - global_position).normalized()
		velocity = direction * speed
		move_and_slide()
		var look_angle = direction.angle()
		rotation = look_angle + PI / 2
	pass


func _on_notice_area_body_entered(body: Node2D) -> void:
	$AnimationPlayer.play("part_walk")
	active = true
	pass # Replace with function body.


func _on_notice_area_body_exited(body: Node2D) -> void:
	active = false
	pass # Replace with function body.


func _on_attack_area_body_entered(body: Node2D) -> void:
	
	pass # Replace with function body.


func _on_attack_area_body_exited(body: Node2D) -> void:
	
	pass # Replace with function body.


func _on_navigation_timer_timeout() -> void:
	if active:
		$NavigationAgent2D.target_position = Globals.player_pos
	pass # Replace with function body.
