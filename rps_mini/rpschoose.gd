extends Node2D

#random variable setup for against computer 
var rng = RandomNumberGenerator.new()
@export var comp_choice = rng.randi_range(1, 3)

#button connections and variables to use
@onready var rock = $VBoxContainer/rock
@onready var paper = $VBoxContainer/paper
@onready var scissor = $VBoxContainer/scissor
@onready var rock_pic = $rock_pic
@onready var paper_pic = $paper_pic
@onready var scissor_pic = $scissor_pic
@onready var rock_pic2 = $rock_pic2
@onready var paper_pic2 = $paper_pic2
@onready var scissor_pic2 = $scissor_pic2
@onready var result_show = $result_show

var r = 1
var p = 2
var s = 3
#result variables for future score calculation
var rps_win = 1
var rps_lose = -1
var tie = 0
var user_choice = 0

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

#button pressed, function activates
func _on_paper_pressed():
	#sets user choice
	user_choice = p
	#reveal the pic user choose and disable buttons
	paper_pic.show()
	paper.hide()
	rock.hide()
	scissor.hide()
	# win condition check
	if user_choice == comp_choice:
		paper_pic2.show()
		result_show.text = "TIE!"
		result_show.show()
	elif comp_choice == r:
		rock_pic2.show()
		result_show.text = "WIN!"
		result_show.show()
	else:
		scissor_pic2.show()
		result_show.text = "LOSE!"
		result_show.show()	
	pass # Replace with function body.


func _on_scissor_pressed():
	user_choice = s
	scissor_pic.show()
	paper.hide()
	rock.hide()
	scissor.hide()
	if user_choice == comp_choice:
		scissor_pic2.show()
		result_show.text = "TIE!"
		result_show.show()
		#if you have the coin variable, please keep the number of coins for each players same when getting a tie
	elif comp_choice == p:
		paper_pic2.show()
		result_show.text = "WIN!"
		result_show.show()
		#if you have the coin variable, please add one to the winner's coin variable
	else:
		rock_pic2.show()
		result_show.text = "LOSE!"
		result_show.show()	
		#if you have the coin variable, please substract one from the loser's coin variable
	pass # Replace with function body.


func _on_rock_pressed():
	user_choice = r
	rock_pic.show()
	paper.hide()
	rock.hide()
	scissor.hide()
	if user_choice == comp_choice:
		rock_pic2.show()
		result_show.text = "TIE!"
		result_show.show()
	elif comp_choice == s:
		scissor_pic2.show()
		result_show.text = "WIN!"
		result_show.show()
	else:
		paper_pic2.show()
		result_show.text = "LOSE!"
		result_show.show()	
	pass # Replace with function body.
