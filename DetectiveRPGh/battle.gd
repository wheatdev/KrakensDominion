extends Node

var num_enemies = 5 #only up to 5 max
var current_enemy_selection = 0

var health_max = 0
var atk_value = 0
var enemy_type = 0

signal current_enemy(current_enemy_selection)
signal enemies(num_enemies)
signal encounter_health(health_max)
signal encounter_damage(atk_value)
signal encounter_type(enemy_type)


func _ready():
	if GlobalVariables.encounter == 1:
		encounter_1()
	elif GlobalVariables.encounter == 2:
		encounter_2()
	elif GlobalVariables.encounter == 3:
		encounter_3()
	else:
		print("Error: Encounter number not updated")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if num_enemies <= 0:
		get_tree().change_scene_to_file("res://victory_screen.tscn")

func encounter_1():
	num_enemies = 1
	health_max = 5
	atk_value = 1
	enemy_type = 1
	enemies.emit(num_enemies)
	encounter_damage.emit(atk_value)
	encounter_health.emit(health_max)
	encounter_type.emit(enemy_type)

func encounter_2():
	num_enemies = 2
	health_max = 5
	atk_value = 1
	enemy_type = 2
	enemies.emit(num_enemies)
	encounter_damage.emit(atk_value)
	encounter_health.emit(health_max)
	encounter_type.emit(enemy_type)

func encounter_3():
	num_enemies = 1
	health_max = 10
	atk_value = 2
	enemy_type = 3
	enemies.emit(num_enemies)
	encounter_damage.emit(atk_value)
	encounter_health.emit(health_max)
	encounter_type.emit(enemy_type)


func on_enemy_death():
	num_enemies -= 1
	enemies.emit(num_enemies)



func _on_enemy_1_mouse_entered():
	current_enemy_selection = 1
	current_enemy.emit(current_enemy_selection)


func _on_enemy_2_mouse_entered():
	current_enemy_selection = 2
	current_enemy.emit(current_enemy_selection)


func _on_enemy_3_mouse_entered():
	current_enemy_selection = 3
	current_enemy.emit(current_enemy_selection)


func _on_enemy_4_mouse_entered():
	current_enemy_selection = 4
	current_enemy.emit(current_enemy_selection)


func _on_enemy_5_mouse_entered():
	current_enemy_selection = 5
	current_enemy.emit(current_enemy_selection)


func _on_player_death():
	if GlobalVariables.encounter == 1 or GlobalVariables.encounter == 2:
		get_tree().change_scene_to_file("res://.godot/exported/133200997/export-c74b09bd733cca5ce7ea3d664b52063e-town.scn")
	elif GlobalVariables.encounter == 3:
		get_tree().change_scene_to_file("res://.godot/exported/133200997/export-471c2fac64cdb7d70104a6f2ca34dcd3-church.scn")
	else:
		print("Error: Encounter not implemented so cannot return player to a level")
	GlobalVariables.playerHealth = GlobalVariables.playerHealthMax
