extends KinematicBody2D

var sword_hit = preload("res://Prefabs/unit2_hit.tscn")
var blood = preload("res://Sprites/AllBlood.tscn")
var death_sound = preload("res://SFX/unit2_death.tscn")

var mov_speed = Vector2(10,0)
var unit_hp = 6
var hitting_melee=false

func _process(delta):
	if $AttackingArea.get_overlapping_areas().size()>0:
		print($AttackingArea.get_overlapping_areas())
		hitting_melee=true
		mov_speed = Vector2(0,0)
	else:
		hitting_melee=false
	if unit_hp<=0:
		GameManager.unit2_counter = 0
		var _death_sound = death_sound.instance()
		get_parent().add_child(_death_sound)
		_death_sound.pitch_scale = rand_range(1,1.2)
		queue_free()
		


func _physics_process(delta):
	move_and_slide(mov_speed)
	if mov_speed==Vector2(10,0):
		$AnimatedSprite.play("Walk")
	if $RayCast2D.is_colliding() && !hitting_melee:
		mov_speed=Vector2(0,0)
		$AnimatedSprite.play("Idle")
	if !$RayCast2D.is_colliding():
		mov_speed=Vector2(10,0)

func _deal_damage():
	match GameManager.unit2_upg:
		1:
			var hit = sword_hit.instance()
			add_child(hit)
			hit.position = Vector2(10,0)
			
			var b1 = blood.instance()
			add_child(b1)
			b1.position = Vector2(6,0)
			b1.position += Vector2(0,1)
			b1.scale = Vector2(0.4,0.4)
		2:
			var hit = sword_hit.instance()
			add_child(hit)
			hit.position = Vector2(10,0)
			var hit2 = sword_hit.instance()
			add_child(hit2)
			hit2.position = Vector2(10,0)
			
			var b1 = blood.instance()
			add_child(b1)
			b1.position = Vector2(6,0)
			b1.position += Vector2(0,1)
			b1.scale = Vector2(0.4,0.4)
	


func _on_attack_timer_timeout():
	if hitting_melee:
		$AnimatedSprite.play("Attack")
		if $AnimatedSprite.frame==5:
			_deal_damage()
			print("dealt dmg")
			$attack_sound.play()
			$AnimatedSprite.frame=6


func _on_DefendingArea_area_entered(area):
	if !area.is_in_group("Unit"):
		unit_hp-=1
