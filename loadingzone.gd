extends Area3D

@export var type = 0
signal Swap

func _on_body_entered(body):
	Swap.emit(type)
