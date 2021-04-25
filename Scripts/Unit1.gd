extends Node2D

var arrow = preload("res://Prefabs/Arrow.tscn")
var death_sound = preload("res://SFX/unit2_death.tscn")

var close_check = false
var v_pos_arr = [-4.5,-23]
var pos_set1 = true
var pos_set2 = true
var hp = 2

func _on_Timer_timeout():
	if $RayCast2D.is_colliding() || $RayCast2D/RayCast2D2.is_colliding() || GameManager.hitting:
		$AnimatedSprite.play("Shoot")
		var a = arrow.instance()
		add_child(a)
		close_check = false
		

	else:
		$AnimatedSprite.stop()
		$AnimatedSprite.play("Idle")

func _process(delta):
	if GameManager.castle_lvl == 4 && pos_set1:
		global_position = Vector2(rand_range(-32-50,-26-50),-4.5)
		pos_set1 = false
	if GameManager.castle_lvl > 4 && pos_set2:
		global_position = Vector2(rand_range(-32-50,-25-50),v_pos_arr[randi() % 2])
		pos_set2 = false
		print(global_position)
	if hp == 0:
		GameManager.unit1_counter -= 1
		queue_free()
		var _death_sound = death_sound.instance()
		get_parent().add_child(_death_sound)
		_death_sound.pitch_scale = rand_range(1.5,2)
		queue_free()
	if get_tree().get_nodes_in_group("Enemy").size() == 0:
		$AnimatedSprite.play("Idle")



func _on_hitbox_area_entered(area):
	if area.is_in_group("EnemyHit"):
		hp -= 1
		print("unit1 took dmg")
