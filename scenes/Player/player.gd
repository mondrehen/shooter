extends CharacterBody2D

var can_laser:bool = true
var can_grenade:bool = true
signal laser(pos,player_direction)
signal grenade(pos,player_direction)
@export var max_speed:int = 500
var speed:int = max_speed
signal laser_timeisup()

func hit():
	print('player was hit')
	Globals.health -= 10
	print(Globals.health)

func _ready() -> void:
	pass
	
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	#input
	var direction  = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	move_and_slide()
	Globals.player_pos = global_position

	
	#rotate
	look_at(get_global_mouse_position())

	var player_direction = (get_global_mouse_position() - position).normalized()
	#laser 
	if Input.is_action_pressed("primary action") and can_laser and Globals.laser_amount > 0:
		Globals.laser_amount -= 1
		$gunfire.emitting = true
		var laser_markers = $laser_start_positions.get_children()
		var selected_laser = laser_markers[randi() % laser_markers.size()]
		print(selected_laser,position,player_direction)
		laser.emit(selected_laser.global_position,player_direction)
		can_laser = false
		$laser_reload_timer.start(-1)
		
	
	#grenade
	if Input.is_action_just_pressed("secondary action") and can_grenade and Globals.grenade_amount > 0:
		Globals.grenade_amount -= 1
		var grenade_marker = $grenade_start_positions.get_children()
		var selected_grenade = grenade_marker[randi() % grenade_marker.size()]
		
		grenade.emit(selected_grenade.global_position,player_direction)
		can_grenade = false
		$grenade_reload_timer.start(-1)
		
func _on_timer_timeout() -> void:
	can_laser = true
	pass # Replace with function body.


func _on_timer_2_timeout() -> void:
	can_grenade = true
	pass # Replace with function body.

	

