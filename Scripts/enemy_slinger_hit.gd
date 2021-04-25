extends Area2D

var aim_dir = Vector2.ZERO
var speed = 2
func _physics_process(_delta):
	var aimCast = get_parent().get_node("aimCast")
	aim_dir = aimCast.cast_to
	aim_dir = aim_dir.normalized()
	position +=speed*aim_dir
	rotate(1)


func _on_destructor_timeout():
	queue_free()


func _on_enemy1_slinger_hit_area_entered(area):
	$CollisionShape2D.queue_free()
	$Sprite.queue_free()
	$hit_sound.play()
