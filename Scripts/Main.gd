extends Node2D

var chestscene = preload("res://Prefabs/ChestScene.tscn")
var adtime = true

var karlar = preload("res://Prefabs/Kar.tscn")
var enemy = preload("res://Prefabs/Enemy1.tscn")
var enemy2 = preload("res://Prefabs/Enemy2.tscn")
var enemy3 = preload("res://Prefabs/Enemy3.tscn")
var enemy4 = preload("res://Prefabs/Enemy4.tscn")
var enemy_kocbas = preload("res://Prefabs/Enemy_kocbas.tscn")
var enemy_slinger = preload("res://Prefabs/Enemy_slinger.tscn")
var megayeti = preload("res://Prefabs/EnemyMegaYeti.tscn")
var yetiking = preload("res://Prefabs/EnemyKingYeti.tscn")
var unit1 = preload("res://Prefabs/Unit1.tscn")
var unit2 = preload("res://Prefabs/unit2.tscn")
var LumberMillScene = preload("res://Prefabs/LumberMillScene.tscn")
var end = load("res://Prefabs/Ending.tscn")
var theend = preload("res://Prefabs/TheEnd.tscn")
var archer = preload("res://Prefabs/Player.tscn")
var warrior = preload("res://Prefabs/Player_Warrior.tscn")

var Messenger = preload("res://Prefabs/MessengerPrefabs/Messenger.tscn")
var messenger_check = false

var repair_cost = 25
var upgrade_cost = 100
var unit1_cost = GameManager.unit1_cost
var unit1_counter = GameManager.unit1_counter
var unit2_cost = GameManager.unit2_cost
var unit2_counter = GameManager.unit2_counter

var enemy_max : int = 3
var enemy1_counter : int = 0
var enemy2_counter : int = 1
var enemy3_counter : int = 0
var enemy4_counter : int = 0
var yerl_can_spawn = false
var kalk_can_spawn = false
var yeti_can_spawn = false

var music_playing = 1
var level_completed_playing = 0
var yetikingcancome = false
export var end_the_game = false setget set_end


func _ready():
	GameManager.admob = $AdMob
	GameManager.canvas = $CanvasModulate
	GameManager.Main = self
	$Music.play()
	_enemy2_generator()
	if GameManager.player_type == "archer":
		var player = archer.instance()
		add_child(player)
		$Doge.obj = player
		player.global_position = Vector2(-113,13.2)
	elif GameManager.player_type == "warrior":
		var player = warrior.instance()
		add_child(player)
		$Doge.queue_free()
		player.global_position = Vector2(-113,14)


func _process(delta):
#	if adtime && get_tree().get_nodes_in_group("Enemy").size() == 0:
#		adloader()
#		print("admob adloader is run in _process")

	if messenger_check == false && GameManager.difficulty == 20 :
		var messenger = Messenger.instance()
		add_child(messenger)
		messenger.position = Vector2(95,11)

		messenger_check = true
		print("messenger happened")
	if GameManager.mute == 0 && music_playing == 0:
		$Music.playing = true
		music_playing = 1

	if GameManager.mute == 1 && music_playing == 1:
		$Music.playing = false
		music_playing = 0


	if get_tree().get_nodes_in_group("Enemy").size() == 0:
		$Main_Difficulty_Timer.paused = false
		if level_completed_playing == 0:
			level_completed_playing = 1
			$level_completed.play()

#	if $LumberMillScene/Camera2D.current == false:
#		$Player/CamNode/Camera2D2.current = true
	
	if GameManager.castlehp==0 || GameManager.Player.unit_hp <= 0:
		queue_free()


#func _repair_castle():
#	if Input.is_action_just_pressed("Repair") && GameManager.coins>=20 && GameManager.castlehp<GameManager.castlehp_max:
#		GameManager.castlehp+=GameManager.castlehp_max/10
#		GameManager.coins-=20
#		$repair_sound.play()
#	elif Input.is_action_just_pressed("Repair") && GameManager.coins<20:
#		$negative_sound.play()
		

func _on_Timer_timeout():
	var kar = karlar.instance()
	add_child(kar)
	kar.position = Vector2(0,-72)
	

func _kocbas_spawner():
	if GameManager.difficulty>19 && GameManager.difficulty % 5 == 0:
		var kocbas = enemy_kocbas.instance()
		kocbas.position = Vector2(120,13)
		add_child(kocbas)

		
func _slinger_spawner():
	if GameManager.difficulty>13 && GameManager.difficulty % 3 == 0:
		var slinger = enemy_slinger.instance()
		slinger.position = Vector2(130,13)
		add_child(slinger)

# new spawner
#func _spawner():
#	cuce()
#	yerl()
#	kalk()
#	yeti()
#
#func cuce():
#	if enemy2_counter < 5:
#		for i in enemy2_counter:
#			_enemy2_generator()
#		enemy2_counter +=1
#	else:
#		for i in 5:
#			_enemy2_generator()
#	pass
#
#func yerl():
#	if GameManager.difficulty == 7:
#		yerl_can_spawn = true
#		enemy2_counter = 1
#		enemy3_counter = 1
#	else:
#		pass
#	if yerl_can_spawn:
#		if GameManager.difficulty % 3 == 2:
#			enemy3_counter += 1
#			pass
#		if enemy3_counter < enemy_max:
#			for i in enemy3_counter:
#				_enemy3_generator()
#			enemy3_counter +=1
#		else:
#			for i in enemy_max:
#				_enemy3_generator()
#	pass
#
#func kalk():
#	if GameManager.difficulty == 20:
#		kalk_can_spawn = true
#		enemy2_counter = 1
#		enemy3_counter = 1
#		enemy4_counter = 1
#	if kalk_can_spawn:
#		if GameManager.difficulty % 5 == 4:
#			enemy4_counter += 1
#			pass
#		if enemy4_counter < enemy_max:
#			for i in enemy4_counter:
#				_enemy4_generator()
#		else:
#			for i in enemy_max:
#				_enemy4_generator()
#	pass
#
#func yeti():
#
#	if GameManager.difficulty == 36:
#		yeti_can_spawn = true
#		enemy2_counter = 1
#		enemy3_counter = 1
#		enemy4_counter = 1
#		enemy1_counter = 1
#		$first_yeti_spawn.play()
#	if yeti_can_spawn:
#		if GameManager.difficulty % 7 == 6:
#			enemy1_counter += 1
#			pass
#		if enemy1_counter < enemy_max:
#			for i in enemy1_counter:
#				_enemy1_generator()
#		else:
#			for i in enemy_max:
#				_enemy1_generator()
#	pass

# old spawner
func _spawner():
	if enemy1_counter<enemy_max:
		if enemy4_counter == 0:
			if enemy4_counter<enemy_max:
				if enemy4_counter == 0:
					if enemy3_counter<enemy_max:
						if enemy3_counter == 0:
							if enemy2_counter<enemy_max:
								for i in range(enemy2_counter):
									_enemy2_generator()
								enemy2_counter+=1
							else:
								for i in range (enemy_max):
									_enemy2_generator()
								enemy3_counter+=1
								enemy2_counter=1
						else:
							for i in range(enemy3_counter):
								_enemy3_generator()
							if enemy2_counter<enemy_max:
								for i in range(enemy2_counter):
									_enemy2_generator()
								enemy2_counter+=1
							else:
								for i in range (enemy_max):
									_enemy2_generator()
								enemy3_counter+=1
								enemy2_counter=1
					else:
						for i in range (enemy_max):
							_enemy2_generator()
							_enemy3_generator()
						enemy4_counter+=1
						enemy3_counter=1
						enemy2_counter=1
				else:
					for i in range(enemy4_counter):
						_enemy4_generator()
					if enemy3_counter<enemy_max:
						if enemy3_counter == 0:
							if enemy2_counter<enemy_max:
								for i in range(enemy2_counter):
									_enemy2_generator()
								enemy2_counter+=1
							else:
								for i in range (enemy_max):
									_enemy2_generator()
								enemy3_counter+=1
								enemy2_counter=1
						else:
							for i in range(enemy3_counter):
								_enemy3_generator()
							if enemy2_counter<enemy_max:
								for i in range(enemy2_counter):
									_enemy2_generator()
								enemy2_counter+=1
							else:
								for i in range (enemy_max):
									_enemy2_generator()
								enemy3_counter+=1
								enemy2_counter=1
					else:
						for i in range (enemy_max):
							_enemy2_generator()
							_enemy3_generator()
						enemy4_counter+=1
						enemy3_counter=1
						enemy2_counter=1
			else:
				for i in range (enemy_max):
					_enemy2_generator()
					_enemy3_generator()
					_enemy4_generator()
				enemy1_counter+=1
				enemy4_counter=1
				enemy3_counter=1
				enemy2_counter=1
		else:
			for _i in range (enemy1_counter):
				_enemy1_generator()
			if enemy4_counter<enemy_max:
				if enemy4_counter == 0:
					if enemy3_counter<enemy_max:
						if enemy3_counter == 0:
							if enemy2_counter<enemy_max:
								for _i in range(enemy2_counter):
									_enemy2_generator()
								enemy2_counter+=1
							else:
								for _i in range (enemy_max):
									_enemy2_generator()
								enemy3_counter+=1
								enemy2_counter=1
						else:
							for _i in range(enemy3_counter):
								_enemy3_generator()
							if enemy2_counter<enemy_max:
								for _i in range(enemy2_counter):
									_enemy2_generator()
								enemy2_counter+=1
							else:
								for _i in range (enemy_max):
									_enemy2_generator()
								enemy3_counter+=1
								enemy2_counter=1
					else:
						for _i in range (enemy_max):
							_enemy2_generator()
							_enemy3_generator()
						enemy4_counter+=1
						enemy3_counter=1
						enemy2_counter=1
				else:
					for _i in range(enemy4_counter):
						_enemy4_generator()
					if enemy3_counter<enemy_max:
						if enemy3_counter == 0:
							if enemy2_counter<enemy_max:
								for _i in range(enemy2_counter):
									_enemy2_generator()
								enemy2_counter+=1
							else:
								for _i in range (enemy_max):
									_enemy2_generator()
								enemy3_counter+=1
								enemy2_counter=1
						else:
							for _i in range(enemy3_counter):
								_enemy3_generator()
							if enemy2_counter<enemy_max:
								for _i in range(enemy2_counter):
									_enemy2_generator()
								enemy2_counter+=1
							else:
								for _i in range (enemy_max):
									_enemy2_generator()
								enemy3_counter+=1
								enemy2_counter=1
					else:
						for _i in range (enemy_max):
							_enemy2_generator()
							_enemy3_generator()
						enemy4_counter+=1
						enemy3_counter=1
						enemy2_counter=1
			else:
				for _i in range (enemy_max):
					_enemy2_generator()
					_enemy3_generator()
					_enemy4_generator()
				if enemy1_counter == 0:
					$first_yeti_spawn.play()
				enemy1_counter+=1
				enemy4_counter=1
				enemy3_counter=1
				enemy2_counter=1
	else:
		for _i in range(enemy_max):
			_enemy1_generator()
			_enemy2_generator()
			_enemy3_generator()
			_enemy4_generator()
	pass

func _on_Main_Difficulty_Timer_timeout():
	if !yetikingcancome:
		_spawner()
		_kocbas_spawner()
		_slinger_spawner()
		print("spawner called")
		GameManager.difficulty+=1
		$difficulty_increase_sound.play()
		$Main_Difficulty_Timer.paused = true
		level_completed_playing = 0
		if GameManager.bluecalled:
			_megayeti_generator()
		if GameManager.redcalled:
			_megayeti_generator()
		if GameManager.yellowcalled:
			_megayeti_generator()
		if GameManager.yellowcalled && GameManager.redcalled && GameManager.bluecalled:
			yetikingcancome = true
	else:
		var king = yetiking.instance()
		add_child(king)
		king.position = Vector2(120,0)
		$Main_Difficulty_Timer.stop()
		$first_yeti_spawn.pitch_scale = 0.5
		$first_yeti_spawn.play()
		$FinalMusic.play()
		$Music.queue_free()
		pass
	adtime = true
	adloader()


func _enemy1_generator():
	var new_enemy = enemy.instance()
	add_child(new_enemy)
	new_enemy.position=Vector2(rand_range(120,140),16)

func _enemy2_generator():
	var new_enemy2 = enemy2.instance()
	add_child(new_enemy2)
	new_enemy2.position = Vector2(rand_range(180,250),14)

func _enemy3_generator():
	var new_enemy3 = enemy3.instance()
	add_child(new_enemy3)
	new_enemy3.position=Vector2(rand_range(100,200),14)

func _enemy4_generator():
	var new_enemy4 = enemy4.instance()
	add_child(new_enemy4)
	new_enemy4.position = Vector2(rand_range(140,160),14)

func _megayeti_generator():
	var new_mega = megayeti.instance()
	add_child(new_mega)
	new_mega.position = Vector2(rand_range(140,160),9)

func _on_GoldCheat_mouse_entered():
	GameManager.coins=100000


func _on_LumberMillEnterance_pressed():
		$LumberMillScene/Camera2D.current = true
		get_tree().paused = true

func _unhandled_input(event):
	if Input.is_action_just_pressed("king"):
		var king = yetiking.instance()
		add_child(king)
		king.position = Vector2(120,0)
		$Main_Difficulty_Timer.stop()
		$first_yeti_spawn.pitch_scale = 0.5
		$first_yeti_spawn.play()
		$FinalMusic.play()
		$Music.queue_free()

func set_end(value):
	get_tree().change_scene_to(theend)
	queue_free()
	pass


func adloader():
	if GameManager.difficulty % 7 == 0:
		var rewardad = chestscene.instance()
		add_child(rewardad)
	elif GameManager.difficulty % 3 == 0 && GameManager.difficulty > 9:
		$AdMob.load_interstitial()
		print("admob interstitial loading")


func _on_AdMob_interstitial_closed():
	adtime = false
	print("admob interstitial closed")

func _on_AdMob_rewarded_video_closed():
	adtime = false
	print("admob rewarded closed")

func _on_AdMob_rewarded(currency, ammount):
	GameManager.coins += 35
	adtime = false


func _on_AdMob_interstitial_loaded():
	if adtime:
		$AdMob.show_interstitial()
		print("admob showing interstitial")



func _on_AdMob_rewarded_video_loaded():
	if adtime:
		$AdMob.show_rewarded_video()
		print("admob showing rewarded video")



func _on_AdMob_interstitial_failed_to_load(error_code):
	print("admob interstitial failed")
	adtime = true
	

func _on_AdMob_rewarded_video_failed_to_load(error_code):
	print("admob rewarded failed")
	adtime = true





