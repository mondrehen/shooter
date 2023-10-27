extends StaticBody2D

signal player_entered_gate


@warning_ignore("unused_parameter")
func _on_area_2d_body_entered(body: Node2D) -> void:
	player_entered_gate.emit()
	pass # Replace with function body.
