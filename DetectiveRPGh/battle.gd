extends Node

var num_enemies = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if num_enemies <= 0:
		get_tree().change_scene_to_file("res://victory_screen.tscn")


func on_enemy_death():
	num_enemies -= 1
