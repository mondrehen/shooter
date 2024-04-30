extends PathFollow2D
var player_nearby:bool = false
@onready var line1:Line2D = $Turret/RayCast2D/Line2D
@onready var line2:Line2D = $Turret/RayCast2D2/Line2D
var Animation_playing:bool = false

func fire():
	Globals.health -= 20
	pass
	
func Nozzle():
	$Turret/FiringNozzle.modulate.a = 1 #Opacity
	var tween = create_tween()
	tween.tween_property($Turret/FiringNozzle, "modulate:a", 0, 0.5)
	pass

func _ready():
	pass
	


func _process(delta):
	progress_ratio += 0.01 * delta
	if player_nearby:
		$Turret.look_at(Globals.player_pos)
	pass

func _on_notice_area_body_entered(body):
	player_nearby = true
	$AnimationPlayer.play("LaserLoad")
	Animation_playing = true
	pass # Replace with function body.


func _on_notice_area_body_exited(body):
	player_nearby = false
	$AnimationPlayer.pause()
	var tween = create_tween()
	tween.set_parallel(true)
	tween.tween_property($Turret/RayCast2D/Line2D,"width",0,randf_range(0.1,0.5))
	tween.tween_property($Turret/RayCast2D2/Line2D,"width",0,randf_range(0.1,0.5))
	await tween.finished
	$AnimationPlayer.stop()
	pass # Replace with function body.
