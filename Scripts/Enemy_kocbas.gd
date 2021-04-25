extends KinematicBody2D

var hit = preload("res://Prefabs/enemy_kocbas_hit.tscn")

signal hit

var speed = Vector2(-5,0)
var hitting = 0
var enemyGold = 8
var enemyHP = 8
var can_hit = true


func _physics_process(_delta):
	move_and_slide(speed)
	if hitting==1:
		if hitting == 1:
			GameManager.hitting = true
		$AnimatedSprite.play("Attack")
		if $AnimatedSprite.frame == 1:
			$kocbas_gerinme.play()
		if $AnimatedSprite.animation=="Attack":
			if $AnimatedSprite.frame == 9 && can_hit:
				_deal_damage()
				$kocbas_attack.play()
				can_hit = false
		if $AnimatedSprite.frame == 15:
			can_hit =true
	else:
		$AnimatedSprite.play("Walk")
	if enemyHP <= 0:
		GameManager.coins += enemyGold
		GameManager.hitting = false
		
		queue_free()
	


func _take_dmg_from_unit1():
	enemyHP-=GameManager.unit1_dmg

func _take_dmg_from_player():
	enemyHP -= GameManager.player_dmg


func _on_AttackingArea_area_entered(_area):
	emit_signal("hit")
	

func _on_Enemy2_hit():
	hitting = 1


func _deal_damage():
	var h = hit.instance()
	add_child(h)
	h.position = Vector2(-20,0)
