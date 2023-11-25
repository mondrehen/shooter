extends CanvasLayer

@onready var laser_label:Label = $Laser/VBoxContainer/Label
@onready var grenade_label:Label = $Grenade/VBoxContainer/Label

func _ready() -> void:
	laser_label.text = str(Globals.laser_amount)
	grenade_label.text = str(Globals.grenade_amount)

func update_laser_label():
	laser_label.text = str(Globals.laser_amount)
	
func update_grenade_label():
	grenade_label.text = str(Globals.grenade_amount)
	
