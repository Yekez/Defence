extends Control

var unit1 = preload("res://Prefabs/Unit1.tscn")
var unit1_2 = preload("res://Prefabs/Unit1_2.tscn")
var unit1_3 = preload("res://Prefabs/Unit1_3.tscn")
var unit2 = preload("res://Prefabs/unit2.tscn")
var unit2_2 = preload("res://Prefabs/unit2_2.tscn")
var unit2_3 = preload("res://Prefabs/unit2_3.tscn")
var repair1 = preload("res://Prefabs/Repair1.tscn")
var repair2 = preload("res://Prefabs/Repair2.tscn")
var repair3 = preload("res://Prefabs/Repair3.tscn")

var unit1_cost = GameManager.unit1_cost
var unit1_2_cost = GameManager.unit1_2_cost
var unit1_3_cost = GameManager.unit1_3_cost

var unit2_cost = GameManager.unit2_cost
var unit2_2_cost = GameManager.unit2_2_cost
var unit2_3_cost = GameManager.unit2_3_cost
var unit2_counter = GameManager.unit2_counter

var repair1_cost = 20
var repair2_cost = 40
var repair3_cost = 75

func _process(_delta):
	if GameManager.barracks_lvl > 1 && GameManager.unit1_upg == 1:
		$Canvas/ArcherUpgrade.modulate = Color(1,1,1,1)
		$Canvas/Archer2_locked.hide()
		$Canvas/Archer2.show()
		$Canvas/Knight2_locked.hide()
		$Canvas/Knight2.show()
		$Canvas/Repair2.show()
		$Canvas/Repair2_locked.hide()
	if GameManager.barracks_lvl > 2 :
		$Canvas/Knight3_locked.hide()
		$Canvas/Knight3.show()
		$Canvas/Archer3_locked.hide()
		$Canvas/Archer3.show()
		$Canvas/Repair3.show()
		$Canvas/Repair3_locked.hide()
	else:
		$Canvas/ArcherUpgrade.modulate = Color(0,0,0,0.5)
	if GameManager.barracks_lvl > 1 && GameManager.unit2_upg == 1:
		$Canvas/KnightUpgrade.modulate = Color(1,1,1,1)
	else:
		$Canvas/KnightUpgrade.modulate = Color(0,0,0,0.5)




func _on_Knight1_pressed():
	if  GameManager.coins>=unit2_cost && GameManager.unit2_counter < 1:
		$unit1_spawn_sound.play()
		GameManager.coins-=unit2_cost
		var u2 = unit2.instance()
		get_tree().current_scene.add_child(u2)
		u2.position = Vector2(-55-50,14)
		GameManager.unit2_counter += 1
	elif unit2_counter==1:
		$negative_sound.play()
	elif GameManager.coins<unit2_cost:
		$negative_sound.play()


func _on_Knight2_pressed():
	if  GameManager.coins>=unit2_2_cost && GameManager.unit2_counter < 1:
		$unit1_spawn_sound.play()
		GameManager.coins-=unit2_2_cost
		var u2_2 = unit2_2.instance()
		get_tree().current_scene.add_child(u2_2)
		u2_2.position = Vector2(-55-50,14)
		GameManager.unit2_counter += 1
	elif unit2_counter==1:
		$negative_sound.play()
	elif GameManager.coins<unit2_2_cost:
		$negative_sound.play()


func _on_Knight3_pressed():
	if  GameManager.coins>=unit2_3_cost && GameManager.unit2_counter < 1:
		$unit1_spawn_sound.play()
		GameManager.coins-=unit2_3_cost
		var u2_3 = unit2_3.instance()
		get_tree().current_scene.add_child(u2_3)
		u2_3.position = Vector2(-55-50,14)
		GameManager.unit2_counter += 1
	elif unit2_counter==1:
		$negative_sound.play()
	elif GameManager.coins<unit2_3_cost:
		$negative_sound.play()


func _on_Archer1_pressed():
	if GameManager.coins>=unit1_cost && GameManager.unit1_counter==0 && GameManager.castle_lvl>0:
		$unit1_spawn_sound.play()
		GameManager.coins-=unit1_cost
		var u1 = unit1.instance()
		get_tree().current_scene.add_child(u1)
		u1.position = Vector2(-27-50,0.2)
		GameManager.unit1_counter += 1
	if  GameManager.coins>=unit1_cost && GameManager.unit1_counter==1 && GameManager.castle_lvl>1:
		$unit1_spawn_sound.play()
		GameManager.coins-=unit1_cost
		var u1 = unit1.instance()
		get_tree().current_scene.add_child(u1)
		u1.position = Vector2(-23-50,-13)
		GameManager.unit1_counter += 1
	if GameManager.coins>=unit1_cost && GameManager.unit1_counter==2 && GameManager.castle_lvl>2:
		$unit1_spawn_sound.play()
		GameManager.coins-=unit1_cost
		var u1 = unit1.instance()
		get_tree().current_scene.add_child(u1)
		u1.position = Vector2(-28-50,-13)
		GameManager.unit1_counter += 1
	elif GameManager.coins<unit1_cost:
		$negative_sound.play()
	elif GameManager.unit1_counter == GameManager.castle_lvl :
		call_deferred("_max_check")

func _on_Archer2_pressed():
	if GameManager.coins>=unit1_2_cost && GameManager.unit1_counter==0 && GameManager.castle_lvl>0:
		$unit1_spawn_sound.play()
		GameManager.coins-=unit1_2_cost
		var u1_2 = unit1_2.instance()
		get_tree().current_scene.add_child(u1_2)
		u1_2.position = Vector2(-27-50,-1)
		GameManager.unit1_counter += 1
	if  GameManager.coins>=unit1_2_cost && GameManager.unit1_counter==1 && GameManager.castle_lvl>1:
		$unit1_spawn_sound.play()
		GameManager.coins-=unit1_2_cost
		var u1_2 = unit1_2.instance()
		get_tree().current_scene.add_child(u1_2)
		u1_2.position = Vector2(-23-50,-14)
		GameManager.unit1_counter += 1
	if GameManager.coins>=unit1_2_cost && GameManager.unit1_counter==2 && GameManager.castle_lvl>2:
		$unit1_spawn_sound.play()
		GameManager.coins-=unit1_2_cost
		var u1_2 = unit1_2.instance()
		get_tree().current_scene.add_child(u1_2)
		u1_2.position = Vector2(-28-50,-14)
		GameManager.unit1_counter += 1
	elif GameManager.coins<unit1_2_cost:
		$negative_sound.play()
	elif GameManager.unit1_counter == GameManager.castle_lvl :
		call_deferred("_max_check")

func _on_Archer3_pressed():
	if GameManager.coins>=unit1_3_cost && GameManager.unit1_counter==0 && GameManager.castle_lvl>0:
		$unit1_spawn_sound.play()
		GameManager.coins-=unit1_3_cost
		var u1_3 = unit1_3.instance()
		get_tree().current_scene.add_child(u1_3)
		u1_3.position = Vector2(-27-50,-2)
		GameManager.unit1_counter += 1
	if  GameManager.coins>=unit1_3_cost && GameManager.unit1_counter==1 && GameManager.castle_lvl>1:
		$unit1_spawn_sound.play()
		GameManager.coins-=unit1_2_cost
		var u1_3 = unit1_3.instance()
		get_tree().current_scene.add_child(u1_3)
		u1_3.position = Vector2(-23-50,-15)
		GameManager.unit1_counter += 1
	if GameManager.coins>=unit1_3_cost && GameManager.unit1_counter==2 && GameManager.castle_lvl>2:
		$unit1_spawn_sound.play()
		GameManager.coins-=unit1_3_cost
		var u1_3 = unit1_3.instance()
		get_tree().current_scene.add_child(u1_3)
		u1_3.position = Vector2(-28-50,-15)
		GameManager.unit1_counter += 1
	elif GameManager.coins<unit1_3_cost:
		$negative_sound.play()
	elif GameManager.unit1_counter == GameManager.castle_lvl :
		call_deferred("_max_check")

func _max_check():
	if GameManager.unit1_counter == GameManager.castle_lvl:
		$negative_sound.play()


func _on_ArcherUpgrade_pressed():
	if GameManager.barracks_lvl>1 && GameManager.coins >=100 && GameManager.unit1_upg == 1:
		GameManager.unit1_upg+=1
		GameManager.coins -= 100
		$unit_upg_sound.play()



func _on_KnightUpgrade_pressed():
	if GameManager.barracks_lvl>1 && GameManager.coins >=100 && GameManager.unit2_upg == 1:
		GameManager.unit2_upg+=1
		GameManager.coins -= 100
		$unit_upg_sound.play()



func _on_Repair1_pressed():
	if GameManager.coins>=repair1_cost && GameManager.castlehp<GameManager.castlehp_max && GameManager.repairman_counter==0:
		GameManager.coins-=repair1_cost
		var repair = repair1.instance()
		get_tree().current_scene.add_child(repair)
		repair.position = Vector2(-64-50,14)
		$repair_sound.play()
		GameManager.repairman_counter += 1

	elif GameManager.coins<repair1_cost || GameManager.repairman_counter !=0:
		$negative_sound.play()

func _on_Repair2_pressed():
	if GameManager.coins>=repair2_cost && GameManager.castlehp<GameManager.castlehp_max && GameManager.repairman_counter==0:
		GameManager.coins-=repair2_cost
		var repair = repair2.instance()
		get_tree().current_scene.add_child(repair)
		repair.position = Vector2(-64-50,15)
		GameManager.repairman_counter += 1
		$repair_sound.play()
	elif GameManager.coins<repair2_cost || GameManager.repairman_counter !=0:
		$negative_sound.play()


func _on_Repair3_pressed():
	if GameManager.coins>=repair3_cost && GameManager.castlehp<GameManager.castlehp_max && GameManager.repairman_counter==0:
		GameManager.coins-=repair3_cost
		var repair = repair3.instance()
		get_tree().current_scene.add_child(repair)
		repair.position = Vector2(-64-50,14)
		GameManager.repairman_counter += 1
		$repair_sound.play()
	elif GameManager.coins<repair3_cost || GameManager.repairman_counter !=0:
		$negative_sound.play()



func _on_Refund_pressed():
	if get_tree().get_nodes_in_group("archer1").size() > 0:
		get_tree().get_nodes_in_group("archer1")[0].queue_free()
		GameManager.unit1_counter -= 1
		GameManager.coins += unit1_cost/2
		$refund.play()
	else:
		if get_tree().get_nodes_in_group("archer2").size() > 0:
			get_tree().get_nodes_in_group("archer2")[0].queue_free()
			GameManager.unit1_counter -= 1
			GameManager.coins += 35
			$refund.play()
		else:
			$negative_sound.play()
			pass

