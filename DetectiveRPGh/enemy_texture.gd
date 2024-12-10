extends MeshInstance3D

var temp_char_num:int = 0
var ol_fishface_texture = load("res://ol_fishface_material.tres")

func _on_ol_fishface_update(image):
	pass
	if temp_char_num == 1:
		material_override = ol_fishface_texture


func _on_cultist_update(image, num):
	pass
	#if num == 1:
		#Change texture to just the first enemy
	#if num == 2:
		#Change texture to first and second enemy
	#else:
		#Error message


func _on_character_num_share(character_num):
	temp_char_num = character_num
