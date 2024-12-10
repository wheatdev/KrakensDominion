extends CharacterBody3D
@export var speed = 5
var fall_acceleration = 50
var target_velocity = Vector3.ZERO
var health = GlobalVariables.enemy_health_max
var pHealth = GlobalVariables.playerHealthMax
var is_dead = false
@export var character_num:int
var current_selection = 0
var enemy_amount = 0
var initial_enemy_amount = 0
@export var is_selected = false
var is_player_blocking = false
var is_disabled = false
var enemy_damage_amount = 0

signal health_update(health)
signal enemy_death()
signal new_turn()
signal player_damaged()
signal player_death()
signal selection_update(is_selected)
signal character_num_share(character_num:int)

signal ol_fishface_update(image:Texture)
var ol_fishface_texture:Texture = get("res://ol_fishface_texture.tres")
signal cultist_update(image:Texture, num:int)
var cultist_texture:Texture = null #Add image later

func _physics_process(delta):
	var position = Vector3() 
	
	if position != Vector3.ZERO:
		position = position.normalized()

	if not is_on_floor():
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)
		
	velocity = target_velocity
	move_and_slide()

func _process(delta):
	if health <= 0 and not is_dead:
		enemy_death.emit()
		is_dead = true
		hide()
	
	if pHealth <= 0:
		player_death.emit()
	
	if initial_enemy_amount < character_num:
		is_disabled = true
		is_dead = true
		hide()
	

func _on_basic_attack_pressed():
	GlobalVariables.is_basic_attack_pressed = true
	if not is_dead and character_num == current_selection and not character_num == 0 and not is_disabled:
		print(character_num)
		health -= 1
		health_update.emit(health)


func _on_sword_attack_pressed():
	GlobalVariables.is_sword_attack_pressed = true
	if not is_dead and character_num == current_selection and not character_num == 0 and not is_disabled:
		health -= 2
		health_update.emit(health)


func on_current_enemy(current_enemy_selection):
	current_selection = current_enemy_selection
	if character_num == current_enemy_selection and character_num != 0 and not is_disabled:
		is_selected = true
	else:
		is_selected = false
	selection_update.emit(is_selected)


func _on_maritimum_remedium():
	if not is_dead:
		pHealth += 4
		health_update.emit(pHealth)


func _on_mare_sonus():
	if not is_dead and character_num == current_selection and not character_num == 0 and not is_disabled:
		health -= 5
		health_update.emit(health)


func _on_end_turn(temp_num_enemies):
	enemy_amount = temp_num_enemies
	player_damaged.emit()

var is_initial_input = true
func _on_battle_enemies(num_enemies):
	if is_initial_input:
		enemy_amount = num_enemies
		initial_enemy_amount = enemy_amount
		is_initial_input = false
	else:
		enemy_amount = num_enemies


func _on_player_damaged():
	if not is_dead and character_num == 0 and not is_disabled:
		for i in range(enemy_amount):
			if not is_player_blocking and not GlobalVariables.is_defend_pressed and not GlobalVariables.current_selected_fish == 2:
				pHealth -= enemy_damage_amount
			GlobalVariables.playerHealth = pHealth
			health_update.emit(pHealth)
	if GlobalVariables.is_defend_pressed:
		GlobalVariables.is_defend_pressed = false
	is_player_blocking = false
	new_turn.emit()


func _on_new_turn():
	GlobalVariables.turn_ended = false


func _on_defend_button_pressed():
	is_player_blocking = true


func _on_fluctus_scutum():
	is_player_blocking = true


func _on_encounter_damage(atk_value):
	enemy_damage_amount = atk_value


func _on_encounter_health(health_max):
	GlobalVariables.enemy_health_max = health_max
	health = health_max


func _on_encounter_type(enemy_type):
	if enemy_type == 1:
		character_num_share.emit(character_num)
		pass #TODO Cultist update
	elif enemy_type == 2:
		character_num_share.emit(character_num)
		pass #TODO Cultist fight #2 update
	elif enemy_type == 3:
		character_num_share.emit(character_num)
		ol_fishface_update.emit(ol_fishface_texture)
	else:
		print("Error: enemy_type not defined yet")
