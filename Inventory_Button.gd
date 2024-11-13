extends Button

var is_hidden:bool = true
signal hide_inventory
signal show_inventory

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GlobalVariables.fish_amount > 0:
		show()
	else:
		hide()


func _on_pressed():
	if is_hidden:
		show_inventory.emit()
		is_hidden = false
	else:
		hide_inventory.emit()
		is_hidden = true


func _on_attacks_attack_active():
	hide_inventory.emit()
	is_hidden = true


func _on_end_turn(num_enemies):
	disabled = true
	if GlobalVariables.is_sacrifice_pressed:
		is_hidden = true
		GlobalVariables.is_sacrifice_pressed = false


func _on_new_turn():
	disabled = false
