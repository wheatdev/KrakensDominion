extends VBoxContainer

var is_hidden:bool = true
var is_bass:bool = false
var is_sunfish:bool = false
var is_blowfish:bool = false
var is_mackerel:bool = false

signal sacrifice(num)

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func on_item_selected():
	set_global_position(get_global_mouse_position())
	if(is_hidden):
		show()
		is_hidden = false
	else:
		hide()
		is_hidden = true
	if GlobalVariables.current_selected_fish == 1:
		is_bass = true
		is_sunfish = false
		is_blowfish = false
		is_mackerel = false
	elif GlobalVariables.current_selected_fish == 2:
		is_bass = false
		is_sunfish = true
		is_blowfish = false
		is_mackerel = false
	elif GlobalVariables.current_selected_fish == 3:
		is_bass = false
		is_sunfish = false
		is_blowfish = true
		is_mackerel = false
	elif GlobalVariables.current_selected_fish == 4:
		is_bass = false
		is_sunfish = false
		is_blowfish = false
		is_mackerel = true
	else:
		is_bass = false
		is_sunfish = false
		is_blowfish = false
		is_mackerel = false


func _on_about_button_pressed():
	hide()
	is_hidden = true
	pass
	#TODO Emit a signal to show a popup menu for each individual fish based on their boolean


func _on_sacrifice_button_pressed():
	GlobalVariables.is_sacrifice_pressed = true
	if is_bass:
		sacrifice.emit(1)
	elif is_sunfish:
		sacrifice.emit(2)
	elif is_blowfish:
		sacrifice.emit(3)
	elif is_mackerel:
		sacrifice.emit(4)
	else:
		sacrifice.emit(0)
	hide()
	is_hidden = true
