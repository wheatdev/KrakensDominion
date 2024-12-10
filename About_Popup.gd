extends RichTextLabel

var is_hidden = false
var bluefin_bass_text:String = "Mare Sonus (Bluefin Bass)
---------------------
Song of the Sea: Basic Coastal Blast
Deals Sizeable damage to your opponents."
var sunfish_text:String = "Fluctus Scutum (Hardscale Sunfish)
---------------------
Wave Shield: Basic Coastal Shield
Useful for when you don't want to take damage."
var blowfish_text:String = "Maritimum Remedium (Blue-Barbed Blowfish)
---------------------
Coastal Remedy: basic healing spell
If you are damaged, this spell will be your friend."
var current_fish = 0
var temp_fish = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	is_hidden = true

func _process(delta):
	current_fish = GlobalVariables.current_selected_fish



func _on_sacrifice_button_pressed():
	hide()
	is_hidden = true


func _on_about_button_pressed():
	if is_hidden:
		temp_fish = current_fish
		show()
		is_hidden = false
		change_text()
	elif not is_hidden and current_fish != temp_fish:
		temp_fish = current_fish
		change_text()
	else:
		temp_fish = current_fish
		hide()
		is_hidden = true

func change_text():
	if GlobalVariables.current_selected_fish == 1:
		text = bluefin_bass_text
	elif GlobalVariables.current_selected_fish == 2:
		text = sunfish_text
	elif GlobalVariables.current_selected_fish == 3:
		text = blowfish_text
	elif GlobalVariables.current_selected_fish == 4:
		text = "This fish is not yet implemented."
	else:
		print("Error: current_selected_fish isn't between 1 and 4 or a fish isn't selected")
