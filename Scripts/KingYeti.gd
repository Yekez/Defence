extends KinematicBody2D

var hit = preload("res://Prefabs/enemy_hit.tscn")

signal hit

var speed = Vector2(-10,0)
var hitting = 0
var enemyGold = 6
var enemyHP = 10
var hitting_melee = false

func _process(_delta):
	if $AttackingMeleeArea.get_overlapping_areas().size()==0:
		hitting = 0
		hitting_melee = false
	if $AttackingArea.get_overlapping_areas().size()>0:
		hitting = 1
		hitting_melee =true


func _physics_process(_delta):
	_yeti_walk()
	move_and_slide(speed)
	if hitting==1 || hitting_melee:
		if hitting == 1:
			GameManager.castlehp -= 10
			GameManager.hitting = true
		$AnimatedSprite.play("Attack")
		if $AnimatedSprite.animation=="Attack":
			if $AnimatedSprite.frame==5:
				_deal_damage()
				_deal_damage()
				_deal_damage()
				_deal_damage()
				_deal_damage()
				_deal_damage()
				$AnimatedSprite.frame=6
				$attack_sound.play()
		
	else:
		$AnimatedSprite.play("Walk")
	if enemyHP <= 0:
		GameManager.coins += enemyGold
		GameManager.hitting = false
		queue_free()


func _yeti_walk():
	if  $AnimatedSprite.frame==3:
		speed = Vector2(0,0)
	elif  $AnimatedSprite.frame==4:
		speed = Vector2(0,0)
	elif  $AnimatedSprite.frame==5:
		speed = Vector2(0,0)
	elif  $AnimatedSprite.frame==10:
		speed = Vector2(0,0)
	elif  $AnimatedSprite.frame==11:
		speed = Vector2(0,0)
	elif  $AnimatedSprite.frame==12:
		speed = Vector2(0,0)
	else:
		speed = Vector2(-10,0)


# warning-ignore:unused_argument
func _on_Area2D_area_entered(_area):
	emit_signal("hit")
	


func _on_Enemy1_hit():
	hitting = 1

func _take_dmg_from_unit1():
	enemyHP-=GameManager.unit1_dmg
	
func _take_dmg_from_unit2():
	enemyHP-=GameManager.unit2_dmg

func _take_dmg_from_player():
	enemyHP -= GameManager.player_dmg
	print("took dmg")


func _on_AttackingMeleeArea_area_entered(_area):
	hitting_melee = true
	
func _deal_damage():
	var h = hit.instance()
	add_child(h)
	h.position = Vector2(-8,0)

