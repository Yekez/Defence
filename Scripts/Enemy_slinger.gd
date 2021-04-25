extends KinematicBody2D

var hit = preload("res://Prefabs/enemy_slinger_hit.tscn")


var speed = Vector2(rand_range(-5,-10),0)
var hitting = 0
var enemyHP = 2
var enemyGold = 2

func _process(delta):
	if enemyHP <= 0:
		GameManager.coins += enemyGold
		queue_free()
	if speed != Vector2.ZERO:
		$AnimatedSprite.play("Walk")
	else:
		$AnimatedSprite.play("Attack")


func _physics_process(delta):
	move_and_slide(speed)


func _take_dmg_from_unit1():
	enemyHP-=GameManager.unit1_dmg
	
func _take_dmg_from_unit2():
	enemyHP-=GameManager.unit2_dmg

func _take_dmg_from_player():
	enemyHP -= GameManager.player_dmg


func _on_AttackingArea_area_entered(area):
	speed = Vector2.ZERO
	$aimCast.cast_to = (area.global_position-global_position)*1.5
	print($aimCast.cast_to)
	
func _on_AttackingArea_area_exited(area):
	speed = Vector2(rand_range(-5,-10),0)

func _deal_damage():
	if $aimCast.is_colliding():
		var h = hit.instance()
		add_child(h)
		h.position = Vector2(-6,0)
		print("slinger dmg spawned")


func _on_attack_speed_timeout():
	$aimCast.force_raycast_update()
	_deal_damage()



