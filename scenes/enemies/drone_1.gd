extends CharacterBody2D
var direction

func _ready() -> void:
	pass
	
func _process(_delta: float) -> void:
	direction = Vector2.RIGHT
	velocity = direction * 100
	move_and_slide()
	
	
	
