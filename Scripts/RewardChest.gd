extends AnimatedSprite


func _ready():
	playing = true

func _process(delta):
	if frame == 22:
		frame = 12
