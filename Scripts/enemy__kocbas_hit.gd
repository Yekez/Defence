extends Area2D




func _on_destructor_timeout():
	queue_free()



func _on_enemy_kocbas_hit_area_entered(_area):
	GameManager.castlehp -= GameManager.castlehp_max/5
