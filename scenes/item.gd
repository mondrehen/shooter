extends Area2D
var rotation_speed:int = 4
var available_options = ['laser','laser','laser','grenade','health']
var type = available_options[randi()%len(available_options)]

func _ready():
	if type == 'laser':
		$Sprite2D.modulate = Color(0,0,1)

func _process(delta):
	rotation += rotation_speed * delta
