extends Area2D

var blood = preload("res://Sprites/AllBlood.tscn")

var collisions = 0




func _on_destructor_timeout():
	queue_free()




func _on_unit2_hit_area_entered(area):
	area = get_overlapping_areas()[0]
	if area.get_parent().has_method("_take_dmg_from_player") && collisions==0: 
		collisions=1
		area.get_parent()._take_dmg_from_player()
		var b1 = blood.instance()
		get_parent().add_child(b1)
		b1.position = Vector2(6,0)
		b1.position += Vector2(0,1)
		b1.scale = Vector2(0.4,0.4)
