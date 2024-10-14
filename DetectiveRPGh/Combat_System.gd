extends Control

signal end_turn
var cur_enemy = 0
var temp_num_enemies = 5
var enemy1_health = 10
var enemy2_health = 10
var enemy3_health = 10
var enemy4_health = 10
var enemy5_health = 10
var damage_amount = 0

func _on_turn_ending_button_pressed():
	if GlobalVariables.is_basic_attack_pressed:
		damage_amount = 1
	elif GlobalVariables.is_sword_attack_pressed:
		damage_amount = 2
	elif GlobalVariables.is_sacrifice_pressed:
		damage_amount = 5
	else:
		print("Error: Other turn ending button pressed")
		print("Basic attack?: " + str(GlobalVariables.is_basic_attack_pressed))
		print("Sword attack?: " + str(GlobalVariables.is_sword_attack_pressed))
		print("Sacrifice?: "+ str(GlobalVariables.is_sacrifice_pressed))
	
	if cur_enemy == 1:
		if enemy1_health - damage_amount <= 0:
			temp_num_enemies -= 1
	elif cur_enemy == 2:
		if enemy2_health - damage_amount <= 0:
			temp_num_enemies -= 1
	elif cur_enemy == 3:
		if enemy3_health - damage_amount <= 0:
			temp_num_enemies -= 1
	elif cur_enemy == 4:
		if enemy4_health - damage_amount <= 0:
			temp_num_enemies -= 1
	elif cur_enemy == 5:
		if enemy5_health - damage_amount <= 0:
			temp_num_enemies -= 1
	else:
		print("Error: current enemy not assigned in combat system")
	GlobalVariables.is_basic_attack_pressed = false
	GlobalVariables.is_sword_attack_pressed = false
	GlobalVariables.is_sacrifice_pressed = false
	end_turn.emit(temp_num_enemies)


func _on_get_current_enemy(current_enemy_selection):
	cur_enemy = current_enemy_selection


func _on_enemy_1_health_update(health):
	enemy1_health = health


func _on_enemy_2_health_update(health):
	enemy2_health = health


func _on_enemy_3_health_update(health):
	enemy3_health = health


func _on_enemy_4_health_update(health):
	enemy4_health = health


func _on_enemy_5_health_update(health):
	enemy5_health = health


func _on_get_enemies(num_enemies):
	temp_num_enemies = num_enemies


func _on_basic_attack_pressed():
	GlobalVariables.is_basic_attack_pressed = true


func _on_sword_attack_pressed():
	GlobalVariables.is_sword_attack_pressed = true
