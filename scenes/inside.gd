extends LevelParent





func _on_exit_gate_area_body_entered(body: Node2D) -> void:
	var tween = create_tween()
	tween.tween_property($Player,"speed",0,2)
	print("player exited the gate area!")
	pass # Replace with function body.
