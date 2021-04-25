extends KinematicBody2D

onready var hit = preload("res://Prefabs/unit2_hit.tscn")
var speed
var castle_reached = false
var HP = 40
var sword_living = true

func _ready():
	$March.play()
	speed = Vector2(-10,0)
	($FlagCarrier as AnimatedSprite).play("Walk")
	($Sword as AnimatedSprite).play("Walk")
	($Spear as AnimatedSprite).play("Walk")

func _physics_process(_delta):
# warning-ignore:return_value_discarded
	move_and_slide(speed)
	fight()
	hit_func()
	if HP < 10 && sword_living:
		$Sword.queue_free()
		($Death as AudioStreamPlayer).play()
		sword_living = false
		#($Area2D as Area2D).position -= Vector2(6,0)
		$CollisionShape2D.position -= Vector2(6,0)
	if HP <= 0:
		# Some sound
		queue_free()
	pass

func _on_Area2D_area_entered(area):
	var arrived = false
	if area.is_in_group("Castle") && !arrived:
		arrived = true
		var main_timer : Timer = GameManager.Main.get_node("Main_Difficulty_Timer")
		main_timer.start()
		speed = Vector2.ZERO
		($FlagCarrier as AnimatedSprite).play("Idle")
		($Sword as AnimatedSprite).play("Idle")
		($Spear as AnimatedSprite).play("Idle")
		castle_reached = true
	if area.is_in_group("EnemyHit"):
		HP -= 1

func fight():
	if sword_living:
		if ($RayCast2D as RayCast2D).is_colliding():
			($Sword as AnimatedSprite).play("Attack")
			if ($Sword as AnimatedSprite).frame == 5:
				($Spear as AnimatedSprite).play("Attack")
		elif !($RayCast2D as RayCast2D).is_colliding() && speed == Vector2.ZERO:
			($Sword as AnimatedSprite).play("Idle")
			($Spear as AnimatedSprite).play("Idle")
	else:
		if ($RayCast2D as RayCast2D).is_colliding():
			($Spear as AnimatedSprite).play("Attack")
		elif !($RayCast2D as RayCast2D).is_colliding() && speed == Vector2.ZERO:
			($Spear as AnimatedSprite).play("Idle")

func hit_func():
	if ($RayCast2D as RayCast2D).is_colliding():
		if sword_living:
			if ($Sword as AnimatedSprite).frame == 4 && ($Sword as AnimatedSprite).animation == "Attack":
				var _hit = hit.instance()
				add_child(_hit)
				($Sword as AnimatedSprite).frame = 5
				($Hit as AudioStreamPlayer).play()
		if ($Spear as AnimatedSprite).frame == 3 && ($Spear as AnimatedSprite).animation == "Attack":
			var _hit = hit.instance()
			add_child(_hit)
			($Spear as AnimatedSprite).frame = 4
			($Hit as AudioStreamPlayer).play()
