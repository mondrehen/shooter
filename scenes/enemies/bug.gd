extends CharacterBody2D
var player_nearby:bool = false
var bug_fireable:bool = false
var speed:int = 50
	
func _process(delta):
	if player_nearby:
		Notice_player()
		var direction:Vector2 = (Globals.player_pos - position).normalized()
		position = position + direction * speed * delta
	pass

func Notice_player():
		look_at(Globals.player_pos)

		

func _on_notice_area_body_entered(body):
	player_nearby = true
	pass # Replace with function body.


func _on_notice_area_body_exited(body):
	player_nearby = false
	pass # Replace with function body.


func _on_attack_area_body_entered(body):
	bug_fireable = true
	
	pass # Replace with function body.


func _on_attack_area_body_exited(body):
	bug_fireable = false
	
	pass # Replace with function body.
