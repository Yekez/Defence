extends Node2D

var speed = Vector2(rand_range(-0.1,0.1),0.2)


func _physics_process(_delta):
	position += speed



func _on_Timer_timeout():
	queue_free()
