extends Area3D

var personalSpace:bool = false
signal speaking
var mindex = 1
var message = str("")
@export var msg1 = str("")
@export var msg2 = str("")
@export var msg3 = str("")
@export var msg4 = str("")
@export var msg5 = str("")
@export var msg6 = str("")
@export var msg7 = str("")
@export var msg8 = str("")
@export var msg9 = str("")
@export var msg10 = str("")

func _physics_process(delta):
	if Input.is_action_just_pressed("action_button"):
		mindex = mindex + 1
		
	if mindex ==1:
		message = msg1
	if mindex ==2:
		message = msg2
	if mindex ==3:
		message = msg3
	if mindex ==4:
		message = msg5
	if mindex ==6:
		message = msg6
	if mindex ==7:
		message = msg7
	if mindex ==8:
		message = msg8
	if mindex ==9:
		message = msg9
	if mindex == 10:
		message = msg10
		
	if personalSpace:
		speaking.emit(message)
		
func _on_body_entered(body):
	personalSpace = true


func _on_body_exited(body):
	personalSpace = false
	mindex = 1
