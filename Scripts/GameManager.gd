extends Node2D

var admob
var player_type
var MessengerMapCam
var PlayerCam
var LumberMillCam
var Main : Node2D
var Player
var yetiking 
var sun
var canvas
var kinghp

var hitting = false


var end = preload("res://Prefabs/Ending.tscn")


export var castlehp = 5000
export var castlehp_max = 5000
export var castle_lvl = 1
export var lumber_lvl = 1
export var barracks_lvl = 1
export var coins = 0
export var difficulty = 1

var player_arrow_direction = Vector2(0,0)
var unit1_counter = 0
var unit2_counter = 0
var repairman_counter = 0

var player_dmg = 1
var unit1_dmg = 1
var unit2_dmg = 1

var unit1_cost = 50
var unit1_2_cost = 75
var unit1_3_cost = 100
var unit2_cost = 10
var unit2_2_cost = 40
var unit2_3_cost = 100

var unit1_upg = 1
var unit2_upg = 1
var unit3_upg = 1

var mute = 0





# Messenger Related

var RedWindow
var BlueWindow
var YellowWindow
var RedRep
var BlueRep
var YellowRep
var Messenger
var MessengerMap
var warning 

var bluecalled = false
var yellowcalled = false
var redcalled = false

func _unhandled_input(event):
	pause_mode = 2
	if Input.is_action_just_pressed("Pause") && !get_tree().paused:
		get_tree().paused = true
	if Input.is_action_just_pressed("Unpause") && get_tree().paused:
		get_tree().paused = false
		


func _process(delta):
	castlehp_max = 2000+ 3000*castle_lvl
	if Player:
		if castlehp<=0 || Player.unit_hp <= 0:
			get_tree().change_scene_to(end)
			castlehp = 5000



func _unit2():
	return unit2_counter

func _hitcheck():
	return hitting



func _castlehp():
	return castlehp
func _coins():
	return coins
	
func set_yeti(value):
	pass

