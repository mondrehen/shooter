extends ContainerParent

func hit():
	if opened == false:
		$LidSprite.hide()
		var pos = $SpawnPositions.get_child(randi()%$SpawnPositions.get_child_count()).global_position
		open.emit(pos,current_direction)
		opened = true
