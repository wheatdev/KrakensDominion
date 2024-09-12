extends CharacterBody3D
@export var speed = 5
var fall_acceleration = 50
var target_velocity = Vector3.ZERO

func _physics_process(delta):
	var position = Vector3() 
	
	if position != Vector3.ZERO:
		position = position.normalized()

	if not is_on_floor():
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)
		
	velocity = target_velocity
	move_and_slide()
