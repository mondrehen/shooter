extends LevelParent

#var outside_level_scene:PackedScene = preload("res://scenes/outside.tscn")




func _on_exit_gate_area_body_entered(body: Node2D) -> void:
	var tween = create_tween()
	tween.tween_property($Player,"speed",0,2)
	print("player exited the gate area!")
	get_tree().change_scene_to_file("res://scenes/outside.tscn")
	pass # Replace with function body.
