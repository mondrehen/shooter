extends Node2D
class_name LevelParent

var laser_scene:PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene = preload("res://scenes/projectiles/grenade.tscn")
var gunfire_scene = preload("res://scenes/gunfire.tscn")
var item_scene:PackedScene = preload("res://scenes/item.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in get_tree().get_nodes_in_group('container'):
		i.connect("open",_on_container_opened)
	print('level node is ready')
	
	for scout in get_tree().get_nodes_in_group('Scouts'):
		scout.connect('laser',_on_scout_laser)
		
	for bug in get_tree().get_nodes_in_group('Bugs'):
		bug.connect('bug_laser_attack',_on_bug_laser)

func _on_bug_laser(pos,direction):
	print("bug is shooting")
	create_laser(pos,direction)
	pass
		
func _on_scout_laser(pos,direction):
	print('scout is shooting.')
	create_laser(pos,direction)
	
func _on_container_opened(pos,direction):
	var item = item_scene.instantiate()
	item.position = pos
	item.direction = direction
	$Items.call_deferred('add_child',item)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass

#laser signal from player.gd
func _on_player_laser(pos,direction) -> void:
	create_laser(pos,direction)
	pass # Replace with function body.

func create_laser(pos,direction):	
	var laser = laser_scene.instantiate() as Area2D
	laser.position = pos 
	laser.rotation_degrees = rad_to_deg(direction.angle()) + 90
	laser.direction = direction
	$projectiles.add_child(laser)
	pass

#grenade signal from player.gd
func _on_player_grenade(pos,player_direction) -> void:
	create_grenade(pos,player_direction)
	pass # Replace with function body.
	
func create_grenade(pos,direction):
	print("grenade from level")
	var grenade = grenade_scene.instantiate() as RigidBody2D
	grenade.linear_velocity = direction * grenade.speed
	grenade.position = pos
	$projectiles.add_child(grenade)
	

func _on_house_player_entered_house() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D,"zoom",Vector2(1,1),1)
	pass # Replace with function body.

func _on_house_player_exited_house() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D,"zoom",Vector2(0.6,0.6),2)
	pass # Replace with function body.

