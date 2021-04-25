extends KinematicBody2D

var sleeping = false

var gravity = 200
var dir = Vector2.ZERO
var speed = 25
var velocity = Vector2.ZERO
onready var obj = Vector2(0,0)



func _physics_process(delta):
	if obj:
		dir = (obj.global_position - global_position).normalized()
		velocity = Vector2(dir.x*speed,gravity*delta)
		move_and_slide(velocity)



func _process(_delta):
	if speed == 0 && $AnimatedSprite.frame==5 && !sleeping:
		$AnimatedSprite.play("Idle")
	if $AnimatedSprite.frame == 15:
		$AnimatedSprite.stop()
			
	if !sleeping:
		if dir.x<0:
			$AnimatedSprite.flip_h = true
		else:
			$AnimatedSprite.flip_h = false


func _on_Near_body_entered(body):
	if body.is_in_group("Player"):
		speed = 0
		$AnimatedSprite.play("Sit")



func _on_Far_body_exited(body):
	if body.is_in_group("Player"):
		$AnimatedSprite.play("Run")
		sleeping = false
		if dir.x<0:
			$AnimatedSprite.flip_h = true
			speed = 25
		if dir.x>0:
			$AnimatedSprite.flip_h = false
			speed = 25





func _on_Timer_timeout():
	sleeping = true
	$AnimatedSprite.play("Yat")
