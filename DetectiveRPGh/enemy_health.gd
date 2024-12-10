extends RichTextLabel

var enemy_amount = 0
var is_enemies_initial = true
@export var number_indicator:int
@export var is_disabled:bool = false

func _process(delta):
	if not enemy_amount >= number_indicator:
		is_disabled = true
		hide()
	



func on_health_update(health):
	if not is_disabled:
		if health > 0 and GlobalVariables.enemy_health_max == 10:
			text = str(health) + "/10"
		elif health > 0:
			text = str(health) + "/" + str(GlobalVariables.enemy_health_max)
		else:
			hide()


func _on_given_enemies(num_enemies):
	if is_enemies_initial:
		enemy_amount = num_enemies
		is_enemies_initial = false
	


func _on_encounter_health(health_max):
	GlobalVariables.enemy_health_max = health_max
	if GlobalVariables.enemy_health_max == 10:
		text = "10/10"
	else:
		text = str(GlobalVariables.enemy_health_max) + "/" + str(GlobalVariables.enemy_health_max)
