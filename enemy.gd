extends Area3D

@export var type = 0 
signal touched

func _on_body_entered(body):
	touched.emit(type)
