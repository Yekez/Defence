extends TextureProgress


func _process(_delta):
	max_value = GameManager.castlehp_max
	value = GameManager.castlehp
