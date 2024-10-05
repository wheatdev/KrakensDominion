extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	text = "10/10"




func on_health_update(health):
	if health > 0:
		text = str(health) + "/10"
	else:
		hide()
