extends VBoxContainer

var is_hidden:bool = true

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
