extends KinematicBody2D

var hit = preload("res://Prefabs/enemy_hit.tscn")

signal hit

var speed = Vector2(-10,0)
var hitting = 0
var enemyHP = 6
var hitting_melee=false
var defensive_mode = false

func _process(_delta):

	if $AttackingMeleeArea.get_overlapping_areas().size()<=0:
		hitting = 0
		hitting_melee = false
	if $AttackingArea.get_overlapping_areas().size()>0:
		hitting = 1
		hitting_melee =true

func _physics_process(_delta):
	move_and_slide(speed)
	if hitting==1 || hitting_melee:
		if hitting == 1:
			GameManager.castlehp -= 1
			GameManager.hitting = true
		$AnimatedSprite.play("Attack")
		if $AnimatedSprite.animation=="Attack":
			if $AnimatedSprite.frame == 11:
				_deal_damage()
				_deal_damage()
				$AnimatedSprite.frame=12
				$AudioStreamPlayer2D.play()
	elif defensive_mode:
		$AnimatedSprite.play("Defensive")
	else:
		$AnimatedSprite.play("Walk")
	if enemyHP <= 0:
		GameManager.coins += 4
		GameManager.hitting = false
		
		queue_free()


func _take_dmg_from_player():
	enemyHP -= GameManager.player_dmg
	defensive_mode = true
	speed = Vector2(-5,0)
func _take_dmg_from_unit1():
	enemyHP-=GameManager.unit1_dmg
	defensive_mode = true
	speed = Vector2(-5,0)
func _take_dmg_from_unit2():
	enemyHP-=GameManager.unit2_dmg



func _on_AttackingArea_area_entered(_area):
	emit_signal("hit")
	


func _on_Enemy2_hit():
	hitting = 1


func _on_AttackingMeleeArea_area_entered(_area):
	hitting_melee = true
	
func _deal_damage():
	var h = hit.instance()
	add_child(h)
	h.position = Vector2(-8,0)

