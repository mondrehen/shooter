extends ContainerParent

func hit():
	if opened == false:
		$LidSprite.hide()
		for i in range(5):
			var pos = $SpawnPositions.get_child(randi()%$SpawnPositions.get_child_count()).global_position
			open.emit(pos,current_direction)
#			print(pos)
		opened = true
		
