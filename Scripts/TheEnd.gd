extends Node2D


func _ready():
	$AnimationPlayer.play("yeti")



func _on_AnimationPlayer_animation_finished(anim_name):
	get_tree().quit()
