extends StaticBody2D

func _ready():
	$upgrade1.hide()
	$upgrade2.hide()
	$upgrade3.hide()
	
func _process(_delta):
	_tower_visibility()
	_barracks_visibility()
	_lumber_visibility()


func _tower_visibility():
	if GameManager.castle_lvl > 1:
		$upgrade1.show()
		$gate.hide()
		$GateLv2.show()
	if GameManager.castle_lvl > 2:
		$upgrade2.show()
		$DuvarLv2.show()
		$upgrade3.show()
	if GameManager.castle_lvl>3:
		$upgrade1.hide()
		$upgrade2.hide()
		$upgrade3.hide()
		$TowerLv1.hide()
		$TowerLvTasLv1.show()
		$DuvarLv2.hide()
		$DuvarLv3.show()
		$GateLv2.hide()
		$GateLv3.show()
	if GameManager.castle_lvl>4:
		$TowerLvTasLv2.show()
	if GameManager.castle_lvl>5:
		$TowerLvTasLv3.show()

func _barracks_visibility():
	match GameManager.barracks_lvl:
		1:
			$ArmyLv1.show()
			$ArmyLv2.hide()
			$ArmyLv3.hide()
		2:
			$ArmyLv1.hide()
			$ArmyLv2.show()
			$ArmyLv3.hide()
		3:
			$ArmyLv1.hide()
			$ArmyLv2.hide()
			$ArmyLv3.show()

func _lumber_visibility():
	match GameManager.lumber_lvl:
		1:
			$LumberMillLv1.show()
			$LumberMillLv2.hide()
			$LumberMillLv3.hide()
		2:
			$LumberMillLv1.hide()
			$LumberMillLv2.show()
			$LumberMillLv3.hide()
		3:
			$LumberMillLv1.hide()
			$LumberMillLv2.hide()
			$LumberMillLv3.show()



