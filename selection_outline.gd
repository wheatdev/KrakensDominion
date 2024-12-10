extends Sprite3D


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()




func _on_selection_update(is_selected):
	if is_selected:
		show()
	else:
		hide()
