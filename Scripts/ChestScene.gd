extends Node2D

func _ready():
	$AnimationPlayer.play("chestscene")
	get_tree().paused = true
	pause_mode = 2
	GameManager.admob.load_banner()


func _on_Skip_pressed():
	get_tree().paused = false
	GameManager.Main.adtime = false
	GameManager.admob.hide_banner()
	queue_free()
	pass # Replace with function body.


func _on_Watch_pressed():
	if GameManager.Main.adtime:
		GameManager.admob.hide_banner()
		get_tree().paused = false
		GameManager.admob.load_rewarded_video()
		queue_free()
	pass # Replace with function body.
