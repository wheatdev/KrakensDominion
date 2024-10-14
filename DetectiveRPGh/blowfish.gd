extends "res://fish_script.gd"

signal Maritimum_Remedium
signal fish_amount(num_fish)

func _ready():
	#TODO Set num_fish to amount based on actual number of this fish
	num_fish = GlobalVariables.fish3
	fish_amount.emit(num_fish)


func fish_ability():
	Maritimum_Remedium.emit()
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
	if num == 3:
		fish_ability()
