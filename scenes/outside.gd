extends LevelParent
#var inside_level_scene:PackedScene = preload("res://scenes/inside.tscn")


func _on_gate_signal_entering() -> void:
	var tween = create_tween()
	tween.tween_property($Player,"speed",0,2)
	print("player entered the gate area!")
	LevelTransition.change_scene("res://scenes/inside.tscn")
	pass # Replace with function body.
