extends Node

signal health_change

var laser_amount = 20
var grenade_amount = 5
var health = 100:
	get:
		return health
	set(value):
		health = value
		health_change.emit()
