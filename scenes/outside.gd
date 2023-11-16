extends LevelParent



func _on_gate_player_entered_gate() -> void:
	var tween = create_tween()
	tween.tween_property($Player,"speed",0,2)
	
	print("player entered the gate area!")
	pass # Replace with function body.
