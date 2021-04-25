extends TouchScreenButton

var clicked = false

func _process(_delta):
	if is_pressed() && get_child_count()>1:
		get_child(1).show()
		clicked = true
		if is_in_group("bluezone"):
			GameManager.BlueWindow.show()
			GameManager.RedWindow.hide()
			GameManager.YellowWindow.hide()
		if is_in_group("redzone"):
			GameManager.BlueWindow.hide()
			GameManager.RedWindow.show()
			GameManager.YellowWindow.hide()
		if is_in_group("yellowzone"):
			GameManager.BlueWindow.hide()
			GameManager.RedWindow.hide()
			GameManager.YellowWindow.show()
	elif get_child_count() == 1:
		hide()
