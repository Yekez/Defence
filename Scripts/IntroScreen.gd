extends Node2D

var main = preload("res://Prefabs/Main.tscn")


func _ready():
	$keepaway_bounce.play("keepaway_bounce")
	$background_color.play("background_color")
	$camera_move.play("camera_move")


func _on_keepaway_bounce_animation_finished(anim_name):
	$keepaway_bounce.play("keepaway_bounce")

func _on_background_color_animation_finished(anim_name):
	$background_color.play("background_color")


func _on_camera_move_animation_finished(anim_name):
	$camera_move.play("camera_move")


func _on_Archer_pressed():
	get_tree().change_scene_to(main)
	GameManager.player_type = "archer"
	queue_free()


func _on_Warrior_pressed():
	get_tree().change_scene_to(main)
	GameManager.player_type = "warrior"
	queue_free()
