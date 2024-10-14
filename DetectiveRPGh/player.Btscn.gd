extends CharacterBody3D
@export var speed = 5
var fall_acceleration = 50
var target_velocity = Vector3.ZERO
var health = 10
var is_dead = false
@export var character_num:int
var current_selection = 0

signal health_update(health)
signal enemy_death()

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
	

func _on_basic_attack_pressed():
	if not is_dead and character_num == current_selection and not character_num == 0:
		health -= 1
		health_update.emit(health)


func _on_sword_attack_pressed():
	if not is_dead and character_num == current_selection and not character_num == 0:
		health -= 2
		health_update.emit(health)


func on_current_enemy(current_enemy_selection):
	current_selection = current_enemy_selection


func _on_maritimum_remedium():
	if not is_dead and character_num == 0:
		health += 2
		health_update.emit(health)


func _on_mare_sonus():
	if not is_dead and character_num == current_selection and not character_num == 0:
		health -= 5
		health_update.emit(health)
