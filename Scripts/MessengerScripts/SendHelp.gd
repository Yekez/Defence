extends TouchScreenButton

var yerli1_cost = 10
var yerli2_cost = 20
var yerli3_cost = 30
var yeti_cost = 40
var megayeti_cost = 50

var enemy_cost
var nation
# Help basılınca attacked_zones -= 1 yapcan

func _process(_delta):
	if get_parent().get_parent().is_in_group("Blue"):
		add_to_group("bluezone")
		nation = GameManager.BlueRep
		if get_parent().is_in_group("yerli1"):
			$GoldText.text=var2str(yerli1_cost)
			enemy_cost = yerli1_cost
		elif get_parent().is_in_group("yerli2"):
			$GoldText.text=var2str(yerli2_cost)
			enemy_cost = yerli2_cost
		elif get_parent().is_in_group("yerli3"):
			$GoldText.text=var2str(yerli3_cost)
			enemy_cost = yerli3_cost
		elif get_parent().is_in_group("yeti"):
			$GoldText.text=var2str(yeti_cost)
			enemy_cost = yeti_cost
		elif get_parent().is_in_group("megayeti"):
			$GoldText.text=var2str(megayeti_cost)
			enemy_cost = megayeti_cost
	if get_parent().get_parent().is_in_group("Red"):
		add_to_group("redzone")
		nation = GameManager.RedRep
		if get_parent().is_in_group("yerli1"):
			$GoldText.text=var2str(yerli1_cost)
			enemy_cost = yerli1_cost
		elif get_parent().is_in_group("yerli2"):
			$GoldText.text=var2str(yerli2_cost)
			enemy_cost = yerli2_cost
		elif get_parent().is_in_group("yerli3"):
			$GoldText.text=var2str(yerli3_cost)
			enemy_cost = yerli3_cost
		elif get_parent().is_in_group("yeti"):
			$GoldText.text=var2str(yeti_cost)
			enemy_cost = yeti_cost
		elif get_parent().is_in_group("megayeti"):
			$GoldText.text=var2str(megayeti_cost)
			enemy_cost = megayeti_cost
	if get_parent().get_parent().is_in_group("Yellow"):
		add_to_group("yellowzone")
		nation = GameManager.YellowRep
		if get_parent().is_in_group("yerli1"):
			$GoldText.text=var2str(yerli1_cost)
			enemy_cost = yerli1_cost
		elif get_parent().is_in_group("yerli2"):
			$GoldText.text=var2str(yerli2_cost)
			enemy_cost = yerli2_cost
		elif get_parent().is_in_group("yerli3"):
			$GoldText.text=var2str(yerli3_cost)
			enemy_cost = yerli3_cost
		elif get_parent().is_in_group("yeti"):
			$GoldText.text=var2str(yeti_cost)
			enemy_cost = yeti_cost
		elif get_parent().is_in_group("megayeti"):
			$GoldText.text=var2str(megayeti_cost)
			enemy_cost = megayeti_cost

func _on_SendHelp_pressed():
	if enemy_cost <= GameManager.coins:
		nation.value += enemy_cost
		GameManager.coins -= enemy_cost 
	else:
		$NegativeSound.play()
		pass
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
	get_parent().get_parent().get_parent().hide()



