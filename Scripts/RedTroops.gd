extends KinematicBody2D
# This is a bad script.
var Bolt = preload("res://Prefabs/MessengerPrefabs/Bolt.tscn")

var speed
var HP = 20 setget hp_set
var bolt1 = false
var bolt2 = false
var castle_reached = false
var flagcarrierdied = false
var cbdied = false


func _ready():
	speed = Vector2(-10,0)
	$FlagCarrier.play("Walk")
	$Crossbowman.play("Walk")
	$Crossbowman2.play("Walk")
	$March.play()

func _physics_process(delta):
	shoot()
	bolt_instancing()
	move_and_slide(speed)

func hp_set(value):
	HP -= value
	print("red hp set")
	if HP < 15 && !flagcarrierdied:
		flagcarrierdied = true
		$CollisionShape2D.position -= Vector2(7,0)
		$Area2D.position -= Vector2(7,0)
		unit_died()
		$FlagCarrier.queue_free()
	if HP < 5 && !cbdied:
		$CollisionShape2D.position -= Vector2(11,0)
		$Area2D.position -= Vector2(11,0)
		cbdied = true
		unit_died()
		$Crossbowman.queue_free()
	if HP <= 0:
		queue_free()
	pass

func unit_died():
	$UnitDied.play()
	$UnitDied.pitch_scale = rand_range(0.9,1.3)
	
func _on_Area2D_area_entered(area):
	var arrived = false
	if area.is_in_group("Castle") && !arrived:
		GameManager.Main.get_node("Main_Difficulty_Timer").start()
		speed = Vector2.ZERO
		$FlagCarrier.play("Idle")
		$Crossbowman.play("Idle")
		$Crossbowman2.play("Idle")
		castle_reached = true
	if area.is_in_group("EnemyHit"):
#		HP -= 1
		hp_set(1)

func shoot():
	if castle_reached == true:
		if !cbdied:
			if $RayCast2D.is_colliding():
				$Crossbowman.play("Attack")
				if $Crossbowman.frame == 3:
					$Crossbowman2.play("Attack")
					
			else:
				if speed == Vector2.ZERO:
					$Crossbowman.play("Idle")
					$Crossbowman2.play("Idle")
		if cbdied:
			if $RayCast2D.is_colliding():
				$Crossbowman2.play("Attack")
			else:
				if speed == Vector2.ZERO:
					$Crossbowman2.play("Idle")
	else:
		pass

func bolt_instancing():
	if $RayCast2D.is_colliding():
		if !cbdied:
			if $Crossbowman.frame == 3 && !bolt1:
				var bolt_1 = Bolt.instance()
				add_child(bolt_1)
				bolt_1.position = Vector2(-6,3)
				bolt1 = true
			if $Crossbowman.frame == 4:
				bolt1 = false
		if $Crossbowman2.frame == 3 && !bolt2:
			var bolt_2 = Bolt.instance()
			add_child(bolt_2)
			bolt_2.position = Vector2(-18,3)
			bolt2 = true
		if $Crossbowman2.frame == 4:
			bolt2 = false
