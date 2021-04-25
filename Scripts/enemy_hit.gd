extends Area2D




func _on_destructor_timeout():
	queue_free()

