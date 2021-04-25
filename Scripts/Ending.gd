extends Node2D

var main = preload("res://Prefabs/Main.tscn")


func _on_TryAgain_pressed():
	GameManager.difficulty = 1
	GameManager.castlehp = 5000
	GameManager.castlehp_max = 5000
	GameManager.castle_lvl = 1
	GameManager.lumber_lvl = 1
	GameManager.barracks_lvl = 1
	GameManager.coins = 0
	GameManager.difficulty = 1
	GameManager.unit1_upg = 1
	GameManager.unit2_upg = 1
	GameManager.unit3_upg = 1
	GameManager.unit1_counter = 0
	GameManager.unit2_counter = 0
	get_tree().change_scene_to(main)


func _on_Quit_pressed():
	get_tree().quit()
