extends Area2D

signal player_entered_house
signal player_exited_house

@warning_ignore("unused_parameter")
func _on_body_entered(body: Node2D) -> void:
	player_entered_house.emit()
	pass # Replace with function body.
	



@warning_ignore("unused_parameter")
func _on_body_exited(body: Node2D) -> void:
	player_exited_house.emit()
	pass # Replace with function body.
