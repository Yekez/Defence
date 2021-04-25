extends AudioStreamPlayer2D


func _on_unit2_death_finished():
	queue_free()
