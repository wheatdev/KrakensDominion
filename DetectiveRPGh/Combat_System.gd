extends Control

signal end_turn

func _on_turn_ending_button_pressed():
	end_turn.emit()
