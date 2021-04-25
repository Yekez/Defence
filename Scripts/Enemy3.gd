extends KinematicBody2D

var hit = preload("res://Prefabs/enemy_hit.tscn")

signal hit

var speed = Vector2(-15,0)
var hitting = 0
var enemyHP = 2
var hitting_melee=false

func _process(_delta):

	if $AttackingMeleeArea.get_overlapping_areas().size()<=0:
		hitting = 0
		hitting_melee = false
	if $AttackingArea.get_overlapping_areas().size()>0:
		hitting = 1

func _physics_process(_delta):
	move_and_slide(speed)
	if hitting==1 || hitting_melee:
		if hitting == 1:
			GameManager.castlehp -= 1
			GameManager.hitting = true
		$AnimatedSprite.play("Attack")
		if $AnimatedSprite.animation=="Attack":
			if $AnimatedSprite.frame == 5:
				if hitting_melee:
					_deal_damage()
				$AnimatedSprite.frame=6
				$AudioStreamPlayer2D.play()
	else:
		$AnimatedSprite.play("Walk")
	if enemyHP <= 0:
		GameManager.coins += 2
		GameManager.hitting = false
		
		queue_free()


func _on_AttackingArea_area_entered(_area):
	emit_signal("hit")
	

func _take_dmg_from_unit1():
	enemyHP-=GameManager.unit1_dmg
	
func _take_dmg_from_unit2():
	enemyHP-=GameManager.unit2_dmg

func _take_dmg_from_player():
	enemyHP -= GameManager.player_dmg


func _on_Enemy2_hit():
	hitting = 1


func _on_AttackingMeleeArea_area_entered(area):
	if area.is_in_group("Unit"):
		hitting_melee = true

	
func _deal_damage():
	var h = hit.instance()
	add_child(h)
	h.position = Vector2(-8,0)

