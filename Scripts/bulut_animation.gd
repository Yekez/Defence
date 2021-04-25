extends Node2D


func _ready():
	$bulut_animaiton.play("bulut_animation")



func _on_bulut_animaiton_animation_finished(_anim_name):
	$bulut_animaiton.play("bulut_animation")
