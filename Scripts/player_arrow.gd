extends Node2D

var blood = preload("res://Sprites/AllBlood.tscn")
var hit_sound = preload("res://SFX/arrow_hit.tscn")

var y = 0
var collisions = 0

func _physics_process(_delta):
	y += 0.1
	var gravity = Vector2(0,y)
	position += GameManager.player_arrow_direction + gravity
	rotation += 0.02

func _on_Timer_timeout():
	queue_free()


func _on_Area2D_area_entered(area):
	area = $Area2D.get_overlapping_areas()[0]
	if area.get_parent().has_method("_take_dmg_from_player") && collisions==0: 
		collisions=1
		area.get_parent()._take_dmg_from_player()
	var b1 = blood.instance()
	get_parent().add_child(b1)
	b1.position = position
	var _hit_sound = hit_sound.instance()
	get_parent().add_child(_hit_sound)
	_hit_sound.pitch_scale = rand_range(2,3)
	$Arrow.queue_free()
	$Area2D.queue_free()

