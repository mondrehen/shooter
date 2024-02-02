extends StaticBody2D

signal signal_entering


func _on_entering_body_entered(_body: Node2D) -> void:
	signal_entering.emit()
	pass # Replace with function body.
