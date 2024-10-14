extends Node


var playerHealth = 20
var playerHealthMax = 20
var playerAttack = 3
var playerSpeed = 5
var playerMagic = 10

var fish1 = 4
var fish2 = 0 
var fish3 = 3 
var fish4 = 4 
var fish5 = 0 

var fish_amount = fish1 + fish2 + fish3 + fish4 + fish5

var current_selected_fish:int = 0
var turn_ended = false

var is_sacrifice_pressed = false
var is_basic_attack_pressed = false
var is_sword_attack_pressed = false
