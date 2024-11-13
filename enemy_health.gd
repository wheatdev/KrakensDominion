extends RichTextLabel

var enemy_amount = 0
var is_enemies_initial = true
@export var number_indicator:int
@export var is_disabled:bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	text = "10/10"

func _process(delta):
	if not enemy_amount >= number_indicator:
		is_disabled = true
		hide()
	



func on_health_update(health):
	if not is_disabled:
		if health > 0:
			text = str(health) + "/10"
		else:
			hide()


func _on_given_enemies(num_enemies):
	if is_enemies_initial:
		enemy_amount = num_enemies
		is_enemies_initial = false
	
