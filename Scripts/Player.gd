extends KinematicBody2D

var arrow = preload("res://Prefabs/player_arrow.tscn")
var aim_line = preload("res://Sprites/Arrow.tscn")

var click = Vector2(0,0)
var release = Vector2(0,0)
var arrow_vector = Vector2(0,0)
var shootable = true
var shooting_bar = 0
var shooting_bar_max = 130

var gravity = 200
var move_speed = 25
var friction = 0.05
var acceleration = 0.1
var velocity = Vector2.ZERO

var unit_hp = 30

func _ready():
	GameManager.PlayerCam = $CamNode/Camera2D2
	$CamNode/Camera2D2.current = true
	GameManager.Player = self



func _camzoominToBarracks():
	$Tween.interpolate_property($CamNode,"position",Vector2(0,0),Vector2(-25,0),1)
	$Tween.start()
	
func _camzoomOutFromBarracks():
	$Tween2.interpolate_property($CamNode,"position",Vector2(-25,0), Vector2(0,0),1)
	$Tween2.start()
	
func _process(_delta):
	#_plus5()
	$CamNode/ProgressBar.value = shooting_bar
	if velocity.x<0:
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false




func _physics_process(delta):
	velocity.y+=gravity*delta
	_movement()
	if !(Input.is_action_pressed("shoot")):
		velocity = move_and_slide(velocity)
	
	_arrow_speed()
	if Input.is_action_pressed("shoot") && shootable:
		$AnimatedSprite.play("Attack")
		if $AnimatedSprite.frame==16:
			$AnimatedSprite.stop()

	if Input.is_action_just_released("shoot") && shootable:
		var ar = arrow.instance()
		add_child(ar)
		$AudioStreamPlayer2D.play()
		$AnimatedSprite.play("Attack")
		shooting_bar = 0
		shootable = false
		$AnimatedSprite.frame=17
	elif $AnimatedSprite.frame==26:
		$AnimatedSprite.play("Idle")
		shootable = true
	if !(Input.is_action_pressed("shoot")):
		if (Input.is_action_pressed("left")) || (Input.is_action_pressed("right")):
			$AnimatedSprite.play("Walk")




func _arrow_speed():
	if (Input.is_action_pressed("shoot"))  && shootable && !Input.is_action_pressed("left"):
		shooting_bar +=5
		arrow_vector.x = min(shooting_bar,shooting_bar_max)

	if Input.is_action_just_released("shoot") && shootable:
		GameManager.player_arrow_direction = Vector2(arrow_vector.x/30,0)+Vector2(0,-1.5)


func _movement():
	var move_direction = +int(Input.is_action_pressed("left")) - int(Input.is_action_pressed("right"))
	velocity.x = lerp(move_speed * move_direction, 0,2)


func _on_AnimatedSprite_animation_finished():
	$AnimatedSprite.play("Idle")
	shootable=true


func _on_Mute_pressed():
	GameManager.mute =1
	$CamNode/TouchButtons/Mute.hide()
	$CamNode/TouchButtons/Unmute.show()


func _on_Unmute_pressed():
	GameManager.mute = 0
	$CamNode/TouchButtons/Mute.show()
	$CamNode/TouchButtons/Unmute.hide()
	
#func _plus5():
#	if get_tree().get_nodes_in_group("Enemy").size() == 0:
#		$plus5tween.interpolate_property($plus5,"modulate:a",1,0,2)
#		$plus5tween.start()




