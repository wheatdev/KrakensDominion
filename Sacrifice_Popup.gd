extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GlobalVariables.is_sacrifice_confirmed:
		hide()


func _on_select_popup_sacrifice_popup():
	set_global_position(get_global_mouse_position() + Vector2(0,-50))
	show()


func _on_sacrifice_deny_pressed():
	hide()
	GlobalVariables.is_sacrifice_pressed = false
