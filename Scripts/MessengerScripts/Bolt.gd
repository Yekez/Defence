extends KinematicBody2D

func _ready():
	$AudioStreamPlayer2D.pitch_scale = rand_range(0.6,0.8)
	$AudioStreamPlayer2D.play()

func _physics_process(delta):
	move_and_slide(Vector2(200,0))

func _on_Area2D_body_entered(body):
	if body.is_in_group("Enemy"):
		body._take_dmg_from_unit1()
		print("Enemy took dmg from red")
		queue_free()


func _on_Area2D_area_entered(area):
	if area.is_in_group("ram"):
		area.get_parent()._take_dmg_from_unit1()
		queue_free()
