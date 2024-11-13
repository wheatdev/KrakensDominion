extends "res://fish_script.gd"

signal Fluctus_Scutum
signal fish_amount(num_fish)

func _ready():
	#TODO Set num_fish to amount based on actual number of this fish
	num_fish = GlobalVariables.fish2
	fish_amount.emit(num_fish)


func fish_ability():
	Fluctus_Scutum.emit()
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
	if num == 2:
		fish_ability()
