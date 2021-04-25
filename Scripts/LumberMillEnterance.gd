extends TouchScreenButton


var clicked = false
var player_in = false
var tween_positive_started = false
var tween_negative_started = false

func _ready():
	$AnimationPlayer.play("ArrowBounceLumber")

func _process(_delta):
	if player_in && !tween_positive_started:
		$Tween.interpolate_property($spot,"modulate:a",0,1,1)
		$Tween.start()
		tween_positive_started = true
	if !player_in && !tween_negative_started:
		$Tween.interpolate_property($spot,"modulate:a",1,0,1)
		$Tween.start()
		tween_negative_started = true

func _on_PlayerDetection_body_entered(body):
	if body.is_in_group("Player"):
		player_in = true
		tween_negative_started = false

func _on_PlayerDetection_body_exited(body):
	if body && body.is_in_group("Player"):
		player_in = false
		tween_positive_started = false

