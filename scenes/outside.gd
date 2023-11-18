extends LevelParent
@export inside_level_scene:PackedScene = preload("res://scenes/inside.tscn")


func _on_gate_player_entered_gate() -> void:
	var tween = create_tween()
	tween.tween_property($Player,"speed",0,2)
	print("player entered the gate area!")
	get_tree().change_scene_to_packed(inside_level_scene)
	pass # Replace with function body.
