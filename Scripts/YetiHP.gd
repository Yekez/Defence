extends TextureProgress

var yetihp setget set_hp

func _ready():
	GameManager.kinghp = self
	hide()


func set_hp(inp):
	show()
	value = inp
