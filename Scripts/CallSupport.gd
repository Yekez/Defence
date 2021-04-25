extends TouchScreenButton


func _on_CallSupport_pressed():
	GameManager.Messenger.start_timer()
	GameManager.MessengerMap.get_node("Timer").stop()
	if get_parent().is_in_group("Blue"):
		GameManager.Messenger.blue_called = true
		GameManager.BlueRep.value -= 200
		GameManager.bluecalled = true
	if get_parent().is_in_group("Red"):
		GameManager.Messenger.red_called = true
		GameManager.RedRep.value -= 100
		GameManager.redcalled = true
	if get_parent().is_in_group("Yellow"):
		GameManager.Messenger.yellow_called = true
		GameManager.YellowRep.value -= 100
		GameManager.yellowcalled = true

