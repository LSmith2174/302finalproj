extends Node2D

#random variable to decide head or tail
var rng_coin = RandomNumberGenerator.new()
@export var h_or_t = rng_coin.randi_range(0, 1)

#sets the buttons and variables to use
@onready var T_choice = $VBoxContainer/T_choice
@onready var H_choice = $VBoxContainer/H_choice
@onready var tail = $tail
@onready var head = $head
@onready var result_show_h_or_t = $result_show_h_or_t

var user_h_or_t = 2

#used in calculating for user coin number
var score = 0

func _ready():
	pass

#if the buttton is pressed, the function activates
func _on_t_choice_pressed():
	#set userchoice to true and show the results
	user_h_or_t = 0
	if h_or_t == 0:
		head.show()
	else:
		tail.show()
	#get score and winneing condition
	if user_h_or_t != h_or_t:
		score = 1
		result_show_h_or_t.text = "WIN!"
	else:
		score = 0
		result_show_h_or_t.text = "LOSE!"
	T_choice.hide()
	H_choice.hide()
	result_show_h_or_t.show()
	pass # Replace with function body.


func _on_h_choice_pressed():
	user_h_or_t = 1
	if h_or_t == 0:
		head.show()
	else:
		tail.show()
	if user_h_or_t != h_or_t:
		score = 1
		result_show_h_or_t.text = "WIN!"
	else:
		score = 0
		result_show_h_or_t.text = "LOSE!"		
	T_choice.hide()
	H_choice.hide()
	result_show_h_or_t.show()
	pass # Replace with function body.
