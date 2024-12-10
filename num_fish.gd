extends RichTextLabel

signal no_fish

func _on_fish_amount(num_fish):
	if num_fish <= 0:
		no_fish.emit()
	else:
		text = str(num_fish)
