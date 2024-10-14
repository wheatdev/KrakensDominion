extends ScrollContainer

var is_hidden:bool = true
signal Attack_Active

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_attack_button_pressed():
	if is_hidden:
		show()
		Attack_Active.emit()
		is_hidden = false
	else:
		hide()
		is_hidden = true


func _on_inventory_button_show_inventory():
	hide()
	is_hidden = true


func _on_end_turn():
	hide()
	is_hidden = true
