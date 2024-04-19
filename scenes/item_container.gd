extends StaticBody2D
class_name ContainerParent
signal open(pos,direction)


#before the ready function
var opened:bool = false
@onready var current_direction: Vector2 = Vector2.DOWN.rotated(rotation)

#ready:applying rotation
#creating node
#func hit():
#	print(current_direction)
#	pass # Replace with function body.
