extends Node2D

func _ready():
	pause_mode = 2
	GameManager.LumberMillCam = $Camera2D

var lumber_cost = 150
var barracks_cost = 200
var tower_cost = 100
var upgrading = true





func _process(delta):
	upgrading = true
	match GameManager.barracks_lvl:
		1:
			$Barracks1.visible = true
			$Barracks2.visible = false
			$Barracks3.visible = false
		2:
			$Barracks1.visible = false
			$Barracks2.visible = true
			$Barracks3.visible = false
		3:
			$Barracks1.visible = false
			$Barracks2.visible = false
			$Barracks3.visible = true
	match GameManager.lumber_lvl:
		1:
			$Lumber1.visible = true
			$Lumber2.visible = false
			$Lumber3.visible = false
		2:
			$Lumber1.visible = false
			$Lumber2.visible = true
			$Lumber3.visible = false
		3:
			$Lumber1.visible = false
			$Lumber2.visible = false
			$Lumber3.visible = true
	match GameManager.castle_lvl:
		1:
			$Tower1.visible = true
			$Tower2.visible = false
			$Tower3.visible = false
			$Tower4.visible = false
			$Tower5.visible = false
			$Tower6.visible = false
		2:
			$Tower1.visible = false
			$Tower2.visible = true
			$Tower3.visible = false
			$Tower4.visible = false
			$Tower5.visible = false
			$Tower6.visible = false
			$Walls/DuvarLv2.visible = true
			$Gates/GateLv1.visible = false
			$Gates/GateLv2.visible = true
		3:
			$Tower1.visible = false
			$Tower2.visible = false
			$Tower3.visible = true
			$Tower4.visible = false
			$Tower5.visible = false
			$Tower6.visible = false
		4:
			$Tower1.visible = false
			$Tower2.visible = false
			$Tower3.visible = false
			$Tower4.visible = true
			$Tower5.visible = false
			$Tower6.visible = false
			$Walls/DuvarLv2.visible = false
			$Walls/DuvarLv3.visible = true
			$Gates/GateLv1.visible = false
			$Gates/GateLv2.visible = false
			$Gates/GateLv3.visible = true
		5:
			$Tower1.visible = false
			$Tower2.visible = false
			$Tower3.visible = false
			$Tower4.visible = false
			$Tower5.visible = true
			$Tower6.visible = false
		6:
			$Tower1.visible = false
			$Tower2.visible = false
			$Tower3.visible = false
			$Tower4.visible = false
			$Tower5.visible = false
			$Tower6.visible = true

func _on_LumUp_pressed():
	if GameManager.lumber_lvl < 3 && GameManager.coins >= lumber_cost:
		GameManager.lumber_lvl += 1
		GameManager.coins -= lumber_cost
		$lumber_upg.play()

	if GameManager.lumber_lvl >= 3 || GameManager.coins < lumber_cost:
		$negative_sound.play()
	GameManager.Main.adtime = true
	GameManager.admob.load_interstitial()

func _on_TowUp_pressed():
	match GameManager.lumber_lvl:
		1:
			if GameManager.castle_lvl <3 && GameManager.coins >= tower_cost:
				GameManager.castle_lvl += 1
				GameManager.coins -= tower_cost
				GameManager.castlehp = GameManager.castlehp_max
				$castle_upgrade.play()
			if GameManager.castle_lvl >= 3 || GameManager.coins < tower_cost:
				$negative_sound.play()
		2:
			if GameManager.castle_lvl <6 && GameManager.coins >= tower_cost:
				GameManager.castle_lvl += 1
				GameManager.coins -= tower_cost
				GameManager.castlehp = GameManager.castlehp_max
				$castle_upgrade.play()
			if GameManager.castle_lvl >= 7 || GameManager.coins < tower_cost:
				$negative_sound.play()
		3:
			if GameManager.castle_lvl <6 && GameManager.coins >= tower_cost:
				GameManager.castle_lvl += 1
				GameManager.coins -= tower_cost
				GameManager.castlehp = GameManager.castlehp_max
				$castle_upgrade.play()
			if GameManager.castle_lvl >= 7 || GameManager.coins < tower_cost:
				$negative_sound.play()
	GameManager.Main.adtime = true
	GameManager.admob.load_interstitial()
func _on_BarUp_pressed():
	match GameManager.lumber_lvl:
		1:
			$negative_sound.play()
		2:
			if GameManager.barracks_lvl < 2 && GameManager.coins >= barracks_cost && upgrading:
				GameManager.barracks_lvl += 1
				GameManager.coins -= barracks_cost
				$barracks_upg.play()
				upgrading = false
			if GameManager.barracks_lvl >= 2 || GameManager.coins < barracks_cost && upgrading:
				$negative_sound.play()
		3:
			if GameManager.barracks_lvl < 3 && GameManager.coins >= barracks_cost && upgrading:
				GameManager.barracks_lvl += 1
				GameManager.coins -= barracks_cost
				$barracks_upg.play()
			if GameManager.barracks_lvl >= 3 || GameManager.coins < barracks_cost && upgrading:
				$negative_sound.play()
	GameManager.Main.adtime = true
	GameManager.admob.load_interstitial()

func _on_BackButton_pressed():
	GameManager.PlayerCam.current = true
	get_tree().paused = false

func _on_Lumber_pressed():
	$CanvasLayer/LumberPop.popup()
func _on_Lumber2_pressed():
	$CanvasLayer/LumberPop.popup()
func _on_Lumber3_pressed():
	$CanvasLayer/LumberPop.popup()

func _on_Barracks_pressed():
	$CanvasLayer/BarracksPop.popup()
func _on_Barracks2_pressed():
	$CanvasLayer/BarracksPop.popup()
func _on_Barracks3_pressed():
	$CanvasLayer/BarracksPop.popup()

func _on_Tower_pressed():
	$CanvasLayer/TowerPop.popup()
	print("test1")
func _on_Tower2_pressed():
	$CanvasLayer/TowerPop.popup()
	print("test2")
func _on_Tower3_pressed():
	$CanvasLayer/TowerPop.popup()
func _on_Tower4_pressed():
	$CanvasLayer/TowerPop.popup()
func _on_Tower5_pressed():
	$CanvasLayer/TowerPop.popup()
func _on_Tower6_pressed():
	$CanvasLayer/TowerPop.popup()










