extends CharacterBody3D
@export var speed = 5
var fall_acceleration = 50
var target_velocity = Vector3.ZERO
var health = 10

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
	if health <= 0:
		enemy_death.emit()
		hide()

func _on_basic_attack_pressed():
	health -= 1
	health_update.emit(health)


func _on_sword_attack_pressed():
	health -= 2
	health_update.emit(health)
