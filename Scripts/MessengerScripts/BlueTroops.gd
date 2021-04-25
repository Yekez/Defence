extends KinematicBody2D

onready var hit = preload("res://Prefabs/unit2_hit.tscn")
var speed
var castle_reached = false
var HP = 50
var sword_living = true
var spear_living = true

func _ready():
	$March.play()
	speed = Vector2(-20,0)
	$FlagCarrier.play("Walk")
	$Sword.play("Walk")
	$Spear.play("Walk")
	$Kicker.play("Walk")

func _physics_process(delta):
	move_and_slide(speed)
	fight()
	hitf()
	if HP < 20 && sword_living:
		$Sword.queue_free()
		$Death.play()
		sword_living = false
		$Spear.position += Vector2(5,0) 

	if HP < 10 && spear_living:
		$Spear.queue_free()
		$Death.play()
		$Kicker.position += Vector2(20,0)
		spear_living = false
	if HP <= 0:
		# Some global sound
		queue_free()
	pass

func _on_Area2D_area_entered(area):
	var arrived = false
	if area.is_in_group("Castle") && !arrived:
		GameManager.Main.get_node("Main_Difficulty_Timer").start()
		speed = Vector2.ZERO
		$FlagCarrier.play("Idle")
		$Sword.play("Idle")
		$Spear.play("Idle")
		castle_reached = true
	if area.is_in_group("EnemyHit"):
		HP -= 1

func fight():
	if sword_living:
		if $RayCast2D.is_colliding():
			$Sword.play("Attack")
			$Kicker.play("Idle")
			if $Sword.frame == 5:
				$Spear.play("Attack")
		elif !$RayCast2D.is_colliding() && speed == Vector2.ZERO:
			$Sword.play("Idle")
			$Spear.play("Idle")
			$Kicker.play("Idle")
	else:
		if spear_living:
			if $RayCast2D.is_colliding():
				$Spear.play("Attack")
				$Kicker.play("Idle")
			elif !$RayCast2D.is_colliding() && speed == Vector2.ZERO:
				$Spear.play("Idle")
				$Kicker.play("Idle")
		else:
			if $RayCast2D.is_colliding():
				$Kicker.play("Attack")
			elif !$RayCast2D.is_colliding() && speed == Vector2.ZERO:
				$Kicker.play("Idle")

func hitf():
	if $RayCast2D.is_colliding():
		if sword_living:
			if $Sword.frame == 5 && $Sword.animation == "Attack":
				var _hit = hit.instance()
				add_child(_hit)
				_hit.position = Vector2(11,7)
				$Sword.frame = 6
				$Hit.play()
			if $Sword.frame == 10 && $Sword.animation == "Attack":
				var _hit = hit.instance()
				add_child(_hit)
				_hit.position = Vector2(11,7)
				$Sword.frame = 11
				$Hit.play()
		if spear_living:
			if $Spear.frame == 4 && $Spear.animation == "Attack":
				var _hit = hit.instance()
				add_child(_hit)
				_hit.position = Vector2(11,7)
				$Spear.frame = 5
				$Hit.play()
		if !sword_living && !spear_living:
			if $Kicker.frame == 10 && $Kicker.animation == "Attack":
				var _hit = hit.instance()
				add_child(_hit)
				_hit.position = Vector2(11,7)
				$Kicker.frame = 11
				$Hit.play()
