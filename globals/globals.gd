extends Node

signal health_change
signal laser_amount_change
signal grenade_amount_change
var player_hit_sound:AudioStreamPlayer2D

func _ready() -> void:
	player_hit_sound = AudioStreamPlayer2D.new()
	player_hit_sound.stream = load("res://audio/solid_impact.ogg")
	add_child(player_hit_sound)


var laser_amount = 20:
	get:
		return laser_amount
	set(value):
		laser_amount = value
		laser_amount_change.emit()
		
var grenade_amount = 5:
	get:
		return grenade_amount
	set(value):
		grenade_amount = value
		grenade_amount_change.emit()

var player_vulnerable:bool = true
var health = 60:
	get:
		return health
	set(value):
		if value > health:
			health = min(value,100)
		else:
			if player_vulnerable == true:
				health = value
				player_vulnerable = false
				player_invulnerable_timer()
				player_hit_sound.play()
				
		health_change.emit()

func player_invulnerable_timer():
	await get_tree().create_timer(0.5).timeout
	player_vulnerable = true
		
var player_pos:Vector2
