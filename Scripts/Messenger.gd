extends KinematicBody2D

onready var redtroops = preload("res://Prefabs/MessengerPrefabs/RedTroops.tscn")
onready var yellowtroops = preload("res://Prefabs/MessengerPrefabs/YellowTroops.tscn")
onready var bluetroops = preload("res://Prefabs/MessengerPrefabs/BlueTroops.tscn")

var speed = Vector2(-30,0)
var player_in = false
var tween_positive_started = false
var tween_negative_started = false
var blue_called = false
var red_called = false
var yellow_called = false

func _ready():
	GameManager.MessengerMap.get_node("Timer").start()
	GameManager.Messenger = self
	$AnimationPlayer.play("ArrowBounceMessenger")
	

func _physics_process(_delta):
	move_and_slide(speed)

func _process(_delta):
	if player_in && !tween_positive_started:
		$Tween.interpolate_property($spot,"modulate:a",0,1,1)
		$Tween.start()
		tween_positive_started = true
	if !player_in && !tween_negative_started:
		$Tween.interpolate_property($spot,"modulate:a",1,0,1)
		$Tween.start()
		tween_negative_started = true
	if speed != Vector2.ZERO:
		$AnimatedSprite.play("Walk")
	else:
		$AnimatedSprite.play("Idle")



func _on_MessengerArea_area_entered(area):
	if area.is_in_group("Bayrak"):
		speed = Vector2.ZERO


func _on_PlayerDetection_body_entered(body):
	if body.is_in_group("Player"):
		player_in = true
		tween_negative_started = false

func _on_PlayerDetection_body_exited(body):
	if body && body.is_in_group("Player"):
		player_in = false
		tween_positive_started = false
		
func _on_TouchScreenButton_pressed():
	GameManager.MessengerMapCam.current = true
	get_tree().paused = true

func start_timer():
	$AnimatedSprite.flip_h = true
	$Timer.start(10)
	GameManager.Main.get_node("Main_Difficulty_Timer").stop()
	speed = Vector2(30,0)

func _on_Timer_timeout():
	speed = Vector2.ZERO
	$ReturnTime.start(180)
	if get_tree().get_nodes_in_group("Enemy").size()>0:
		$Timer.start(5)
	else:
	# Troopları burdan instantiate et
		if blue_called:
			var blue_troops = bluetroops.instance()
			GameManager.Main.add_child(blue_troops)
			blue_troops.global_position = Vector2(120,8)
			blue_called = false
			print("blue called")
		if red_called:
			var red_troops = redtroops.instance()
			GameManager.Main.add_child(red_troops)
			red_troops.global_position = Vector2(120,10)
			red_called = false
			print("red called")
		if yellow_called:
			var yellow_troops = yellowtroops.instance()
			GameManager.Main.add_child(yellow_troops)
			yellow_troops.global_position = Vector2(120,14)
			yellow_called = false
			print("yellow called")



func _on_ReturnTime_timeout():
	if !get_tree().get_nodes_in_group("ally"):
		$AnimatedSprite.flip_h = false
		speed = Vector2(-30,0)
		GameManager.MessengerMap.get_node("Timer").start()
	else:
		print("ally present so messenger cant come")
		$ReturnTime.start(50)
		pass
	


func _on_VisibilityNotifier2D_screen_entered():
	GameManager.warning.hide()
	print("warning hidden")
