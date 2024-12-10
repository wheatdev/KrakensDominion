extends "res://fish_script.gd"

signal Triplex_Imbre
signal fish_amount(num_fish)

func _ready():
	#TODO Set num_fish to amount based on actual number of this fish
	num_fish = GlobalVariables.fish4
	fish_amount.emit(num_fish)


func fish_ability():
	Triplex_Imbre.emit()
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
	if num == 4:
		fish_ability()
