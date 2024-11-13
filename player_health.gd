extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	text = str(GlobalVariables.playerHealth) + "/" + str(GlobalVariables.playerHealthMax) +" Health"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_player_health_update(health):
	text = str(health) + "/" + str(GlobalVariables.playerHealthMax) +" Health"
