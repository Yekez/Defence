extends Node2D

var blood = preload("res://Sprites/AllBlood.tscn")
var hit_sound = preload("res://SFX/arrow_hit.tscn")
var collisions = 0


var y = 0

func _physics_process(delta):
	y += 0.05
	var gravity = Vector2(0,y)
	if !GameManager.hitting:
		position += Vector2(rand_range(0,3),rand_range(-1.5,0)) + gravity
	else:
		position += Vector2(rand_range(0,1),rand_range(0,0)) + gravity
	rotation += 0.02


func _on_Area2D_area_entered(area):
	area = $Area2D.get_overlapping_areas()[0]
	if area.get_parent().has_method("_take_dmg_from_player") && collisions==0: 
		collisions=1
		area.get_parent()._take_dmg_from_unit1()
	var b1 = blood.instance()
	get_parent().add_child(b1)
	b1.position = position
	var _hit_sound = hit_sound.instance()
	get_parent().add_child(_hit_sound)
	_hit_sound.pitch_scale = rand_range(2.5,3.5)
	$Arrow.queue_free()
	$Area2D.queue_free()

	


func _on_Timer_timeout():
	queue_free()
