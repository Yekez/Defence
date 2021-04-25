extends Node2D

var speed1 = Vector2(rand_range(-1,1),rand_range(-1,1))
var speed2 = Vector2(rand_range(-1,1),rand_range(-1,1))
var speed3 = Vector2(rand_range(-1,1),rand_range(-1,1))
var speed4 = Vector2(rand_range(-1,1),rand_range(-1,1))

func _physics_process(_delta):
	position += Vector2(0,0.2)
	$blood1.position += speed1
	$blood2.position += speed2
	$blood3.position += speed3
	$blood4.position += speed4

func _on_Timer_timeout():
	queue_free()

