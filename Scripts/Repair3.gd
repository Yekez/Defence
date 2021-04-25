extends KinematicBody2D

var speed = 20
var dir = Vector2(1,0)
var repairing = false
var repair_counter = 0



func _physics_process(_delta):
	move_and_slide(speed*dir)
	
func _process(_delta):

	if dir != Vector2.ZERO:
		$AnimatedSprite.play("Walk")
		if dir == Vector2(-1,0):
			$AnimatedSprite.flip_h = true
		if dir == Vector2(1,0):
			$AnimatedSprite.flip_h = false
	if dir == Vector2.ZERO && !repairing:
		dir = Vector2(-1,0)

func _on_RepairArea_area_entered(area):
	if area.is_in_group("Castle"):
		dir = Vector2.ZERO
		$AnimatedSprite.play("Repair")
		repairing = true
		$Timer.start()
	if area.is_in_group("Barracks"):
		queue_free()
		GameManager.repairman_counter = 0
	



func _on_Timer_timeout():
		GameManager.castlehp += GameManager.castlehp_max/10
		repair_counter += 1
		if repair_counter == 4:
			repairing = false
			$Timer.stop()





