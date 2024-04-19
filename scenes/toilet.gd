extends ContainerParent

func hit():
	if opened == false:
		$LidSprite.hide()
		var pos = $SpawnPositions/Marker2D.global_position
		open.emit(pos,current_direction)
		opened = true


