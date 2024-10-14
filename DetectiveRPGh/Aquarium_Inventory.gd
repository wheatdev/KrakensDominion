extends ScrollContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_inventory_button_show_inventory():
	show()


func _on_inventory_button_hide_inventory():
	hide()


func _on_end_turn():
	hide()
