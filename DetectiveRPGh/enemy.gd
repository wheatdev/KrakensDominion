extends Area3D

@export var encounter_num:int

func _process(delta):
	if body_entered:
		GlobalVariables.encounter = encounter_num
