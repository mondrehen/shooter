extends CanvasLayer

#colors
var green: Color = Color("6bbfa3")  
var red:Color = Color(0.9,0,0,1)


@onready var laser_label:Label = $Laser/VBoxContainer/Label
@onready var grenade_label:Label = $Grenade/VBoxContainer/Label
@onready var laser_icon:TextureRect = $Laser/VBoxContainer/TextureRect
@onready var grenade_icon = $Grenade/VBoxContainer/TextureRect


func _ready() -> void:
	update_grenade_label()
	update_laser_label()
#	laser_label.text = str(Globals.laser_amount)
#	grenade_label.text = str(Globals.grenade_amount)

func update_laser_label():
	laser_label.text = str(Globals.laser_amount)
	laser_label.modulate = green
	laser_icon.modulate = green
	update_color(Globals.laser_amount,laser_label,laser_icon)
	
func update_grenade_label():
	grenade_label.text = str(Globals.grenade_amount)
	update_color(Globals.grenade_amount,grenade_label,grenade_icon)
	
func update_color(amount:int,label:Label,icon:TextureRect) -> void:
	if amount <= 0:
		label.modulate = red
		icon.modulate = red
	else:
		label.modulate = green
		icon.modulate = green
	
	
