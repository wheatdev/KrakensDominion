extends "res://fish_script.gd"

signal Mare_Sonus
signal fish_amount(num_fish)

func _ready():
	#TODO Set num_fish to amount based on actual number of this fish
	num_fish = 1
	fish_amount.emit(num_fish)


func fish_ability():
	#Mare Sonus
	Mare_Sonus.emit()
	if num_fish <= 0:
		num_fish = 0
	else:
		num_fish -= 1
	fish_amount.emit(num_fish)


func _on_no_fish():
	hide()


func _on_pressed():
	GlobalVariables.current_selected_fish = identifier


func _on_sacrifice(num):
	if num == 1:
		fish_ability()
