extends Node

var num_enemies = 5
var current_enemy_selection = 0

signal current_enemy(current_enemy_selection)
signal enemies(num_enemies)


func _ready():
	enemies.emit(num_enemies)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if num_enemies <= 0:
		get_tree().change_scene_to_file("res://victory_screen.tscn")


func on_enemy_death():
	num_enemies -= 1
	enemies.emit(num_enemies)



func _on_enemy_1_mouse_entered():
	current_enemy_selection = 1
	current_enemy.emit(current_enemy_selection)


func _on_enemy_2_mouse_entered():
	current_enemy_selection = 2
	current_enemy.emit(current_enemy_selection)


func _on_enemy_3_mouse_entered():
	current_enemy_selection = 3
	current_enemy.emit(current_enemy_selection)


func _on_enemy_4_mouse_entered():
	current_enemy_selection = 4
	current_enemy.emit(current_enemy_selection)


func _on_enemy_5_mouse_entered():
	current_enemy_selection = 5
	current_enemy.emit(current_enemy_selection)


func _on_player_death():
	#TODO Implement what happens when the player dies
	print("You Died! (Placeholder)")
	GlobalVariables.playerHealth = GlobalVariables.playerHealthMax
