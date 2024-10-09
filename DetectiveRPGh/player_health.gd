extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	text = "10/10 health"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_health_update(health):
	text = str(health)+"/10 health"
