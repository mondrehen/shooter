extends Node2D

var laser_scene:PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene = preload("res://scenes/projectiles/grenade.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print('level node is ready')
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass


func _on_gate_player_entered_gate() -> void:
	print("player entered the gate!")
	pass # Replace with function body.


func _on_player_laser(pos,direction) -> void:
	print("laser signal received")
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos 
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	laser.direction = direction
	$projectiles.add_child(laser)
	pass # Replace with function body.



func _on_player_grenade(pos,player_direction) -> void:
	print("grenade from level")
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.linear_velocity = player_direction * grenade.speed
	grenade.position = pos
	$projectiles.add_child(grenade)
	pass # Replace with function body.
