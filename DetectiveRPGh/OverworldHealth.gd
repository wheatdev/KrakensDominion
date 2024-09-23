extends Label

func _physics_process(delta):
	text = str(GlobalVariables.playerHealth) + "/" + str(GlobalVariables.playerHealthMax)

