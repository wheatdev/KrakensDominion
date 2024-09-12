extends CharacterBody3D
@export var speed = 5
var fall_acceleration = 50
var target_velocity = Vector3.ZERO
var talking = 0 

signal relay

func _physics_process(delta):
	var position = Vector3() 
	if Input.is_action_pressed("move_back"):
		position.z = position.z + 1
	if Input.is_action_pressed("move_forward"):
		position.z = position.z -1
	if Input.is_action_pressed("move_left"):
		position.x = position.x - 1
	if Input.is_action_pressed("move_right"):
		position.x = position.x + 1
	
	if position != Vector3.ZERO:
		position = position.normalized()
	
	target_velocity.x = position.x * speed
	target_velocity.z = position.z * speed

	if not is_on_floor():
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)
		
	velocity = target_velocity
	move_and_slide()






func _on_area_3d_speaking(message):
	$Label.text = str(message)




func _on_area_3d_body_exited(body):
	$Label.text = " "


func _on_area_3d_2_body_entered(body):
	get_tree().change_scene_to_file("res://battle.tscn")


func _on_loading_zone_swap(type):
	if type == 1:
		get_tree().change_scene_to_file("res://church.tscn")
	if type == 2:
		get_tree().change_scene_to_file("res://town.tscn")
