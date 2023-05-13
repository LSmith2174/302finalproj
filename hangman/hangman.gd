extends Node2D

#randomly generate a number to decide between 5 random comp-sci related words
var rng_word = RandomNumberGenerator.new()
@export var ran_word_num = rng_word.randi_range(1, 5)

#initialize the variables and buttons
@onready var al1 = $al1
@onready var al2 = $al2
@onready var play = $play

@onready var A = $al1/A
@onready var B = $al1/B
@onready var C = $al1/C
@onready var D = $al1/D
@onready var E = $al1/E
@onready var F = $al1/F
@onready var G = $al1/G
@onready var H = $al1/H
@onready var I = $al1/I
@onready var J = $al1/J
@onready var K = $al1/K
@onready var L = $al1/L
@onready var M = $al1/M
@onready var N = $al2/N
@onready var O = $al2/O
@onready var P = $al2/P
@onready var Q = $al2/Q
@onready var R = $al2/R
@onready var S = $al2/S
@onready var T = $al2/T
@onready var U = $al2/U
@onready var V = $al2/V
@onready var W = $al2/W
@onready var X = $al2/X
@onready var Y = $al2/Y
@onready var Z = $al2/Z

@onready var head = $head
@onready var body = $body
@onready var l_arm = $l_arm
@onready var r_arm = $r_arm
@onready var l_leg = $l_leg
@onready var r_leg = $r_leg

@onready var word_1 = $word1
@onready var word_2 = $word2
@onready var word_3 = $word3
@onready var word_4 = $word4
@onready var word_5 = $word5
@onready var word_6 = $word6

@onready var word_empty = $word_empty
@onready var result_shown = $result_shown

@onready var user_ch

#variables to set alphabets 
@onready var a = 1
@onready var b = 2
@onready var c = 3
@onready var d = 4
@onready var e = 5
@onready var f = 6
@onready var g = 7
@onready var h = 8
@onready var i = 9
@onready var j = 10
@onready var k = 11
@onready var l = 12
@onready var m = 13
@onready var n = 14
@onready var o = 15
@onready var p = 16
@onready var q = 17
@onready var r = 18
@onready var s = 19
@onready var t = 20
@onready var u = 21
@onready var v = 22
@onready var w = 23
@onready var x = 24
@onready var y = 25
@onready var z = 26

#variables to set empty  letter parts of 6 letter words
@onready var w1 = 0
@onready var w2 = 0
@onready var w3 = 0
@onready var w4 = 0
@onready var w5 = 0
@onready var w6 = 0

#counter for the correct and incorrect number
@onready var correct = 0
@onready var incorrect = 0

#random words
#switch
#syntax
#method
#coding
#object

func _ready():
	pass

func _on_play_pressed():
	play.hide()
	al1.show()
	al2.show()
	word_1.hide()
	word_2.hide()
	word_3.hide()
	word_4.hide()
	word_5.hide()
	word_6.hide()
	correct = 0
	incorrect = 0
	# set the words
	if ran_word_num == 1:
		w1 = s
		w2 = y
		w3 = n
		w4 = t
		w5 = a
		w6 = x
	elif ran_word_num == 2:
		w1 = s
		w2 = w
		w3 = i
		w4 = t
		w5 = c
		w6 = h
	elif ran_word_num == 3:
		w1 = m
		w2 = e
		w3 = t
		w4 = h
		w5 = o
		w6 = d
	elif ran_word_num == 4:
		w1 = c
		w2 = o
		w3 = d
		w4 = i
		w5 = n
		w6 = g
	elif ran_word_num == 5:
		w1 = o
		w2 = b
		w3 = j
		w4 = e
		w5 = c
		w6 = t
	pass # Replace with function body.

#the following codes after this line contains all alphabet buttons and what activates when pressing them
func _on_a_pressed():
	# hide a button so it no longer activates
	A.hide()
	# set user choice to 1, which is 'a'
	user_ch = 1
	#check each 6 letters and reveal them when they are correct
	if w1 == user_ch:
		word_1.text = "A"
		word_1.show()
	if w2 == user_ch:
		word_2.text = "A"
		word_2.show()
	if w3 == user_ch:
		word_3.text = "A"
		word_3.show()
	if w4 == user_ch:
		word_4.text = "A"
		word_4.show()
	if w5 == user_ch:
		word_5.text = "A"
		word_5.show()
	if w6 == user_ch:
		word_6.text = "A"
		word_6.show()
	#calculate the correct and incorrect times
	if w1 != user_ch && w2 != user_ch && w3 != user_ch && w4 != user_ch && w5 != user_ch && w6 != user_ch:
		incorrect += 1
	else:
		correct += 1
	#show hangman pic when wrong 
	if incorrect == 1:
		head.show()
	elif incorrect == 2:
		body.show()
	elif incorrect == 3:
		l_arm.show()
	elif incorrect == 4:
		r_arm.show()
	elif incorrect == 5:
		l_leg.show()
	#display lose
	elif incorrect == 6:
		r_leg.show()
		result_shown.text = "lose"
		result_shown.show()
	# display win
	if correct == 6:
		result_shown.text = "win"
		result_shown.show()
	pass # Replace with function body.

func _on_b_pressed():
	B.hide()
	user_ch = 2
	if w1 == user_ch:
		word_1.text = "B"
		word_1.show()
	if w2 == user_ch:
		word_2.text = "B"
		word_2.show()
	if w3 == user_ch:
		word_3.text = "B"
		word_3.show()
	if w4 == user_ch:
		word_4.text = "B"
		word_4.show()
	if w5 == user_ch:
		word_5.text = "B"
		word_5.show()
	if w6 == user_ch:
		word_6.text = "B"
		word_6.show()
	if w1 != user_ch && w2 != user_ch && w3 != user_ch && w4 != user_ch && w5 != user_ch && w6 != user_ch:
		incorrect += 1
	else:
		correct += 1
	if incorrect == 1:
		head.show()
	elif incorrect == 2:
		body.show()
	elif incorrect == 3:
		l_arm.show()
	elif incorrect == 4:
		r_arm.show()
	elif incorrect == 5:
		l_leg.show()
	elif incorrect == 6:
		r_leg.show()
		result_shown.text = "lose"
		result_shown.show()
	if correct == 6:
		result_shown.text = "win"
		result_shown.show()
	pass # Replace with function body.

func _on_c_pressed():
	C.hide()
	user_ch = 3
	if w1 == user_ch:
		word_1.text = "C"
		word_1.show()
	if w2 == user_ch:
		word_2.text = "C"
		word_2.show()
	if w3 == user_ch:
		word_3.text = "C"
		word_3.show()
	if w4 == user_ch:
		word_4.text = "C"
		word_4.show()
	if w5 == user_ch:
		word_5.text = "C"
		word_5.show()
	if w6 == user_ch:
		word_6.text = "C"
		word_6.show()
	if w1 != user_ch && w2 != user_ch && w3 != user_ch && w4 != user_ch && w5 != user_ch && w6 != user_ch:
		incorrect += 1
	else:
		correct += 1
	if incorrect == 1:
		head.show()
	elif incorrect == 2:
		body.show()
	elif incorrect == 3:
		l_arm.show()
	elif incorrect == 4:
		r_arm.show()
	elif incorrect == 5:
		l_leg.show()
	elif incorrect == 6:
		r_leg.show()
		result_shown.text = "lose"
		result_shown.show()
	if correct == 6:
		result_shown.text = "win"
		result_shown.show()
	pass # Replace with function body.

func _on_d_pressed():
	D.hide()
	user_ch = 4
	if w1 == user_ch:
		word_1.text = "D"
		word_1.show()
	if w2 == user_ch:
		word_2.text = "D"
		word_2.show()
	if w3 == user_ch:
		word_3.text = "D"
		word_3.show()
	if w4 == user_ch:
		word_4.text = "D"
		word_4.show()
	if w5 == user_ch:
		word_5.text = "D"
		word_5.show()
	if w6 == user_ch:
		word_6.text = "D"
		word_6.show()
	if w1 != user_ch && w2 != user_ch && w3 != user_ch && w4 != user_ch && w5 != user_ch && w6 != user_ch:
		incorrect += 1
	else:
		correct += 1
	if incorrect == 1:
		head.show()
	elif incorrect == 2:
		body.show()
	elif incorrect == 3:
		l_arm.show()
	elif incorrect == 4:
		r_arm.show()
	elif incorrect == 5:
		l_leg.show()
	elif incorrect == 6:
		r_leg.show()
		result_shown.text = "lose"
		result_shown.show()
	if correct == 6:
		result_shown.text = "win"
		result_shown.show()
	pass # Replace with function body.

func _on_e_pressed():
	E.hide()
	user_ch = 5
	if w1 == user_ch:
		word_1.text = "E"
		word_1.show()
	if w2 == user_ch:
		word_2.text = "E"
		word_2.show()
	if w3 == user_ch:
		word_3.text = "E"
		word_3.show()
	if w4 == user_ch:
		word_4.text = "E"
		word_4.show()
	if w5 == user_ch:
		word_5.text = "E"
		word_5.show()
	if w6 == user_ch:
		word_6.text = "E"
		word_6.show()
	if w1 != user_ch && w2 != user_ch && w3 != user_ch && w4 != user_ch && w5 != user_ch && w6 != user_ch:
		incorrect += 1
	else:
		correct += 1
	if incorrect == 1:
		head.show()
	elif incorrect == 2:
		body.show()
	elif incorrect == 3:
		l_arm.show()
	elif incorrect == 4:
		r_arm.show()
	elif incorrect == 5:
		l_leg.show()
	elif incorrect == 6:
		r_leg.show()
		result_shown.text = "lose"
		result_shown.show()
	if correct == 6:
		result_shown.text = "win"
		result_shown.show()
	pass # Replace with function body.

func _on_f_pressed():
	F.hide()
	user_ch = 6
	if w1 == user_ch:
		word_1.text = "F"
		word_1.show()
	if w2 == user_ch:
		word_2.text = "F"
		word_2.show()
	if w3 == user_ch:
		word_3.text = "F"
		word_3.show()
	if w4 == user_ch:
		word_4.text = "F"
		word_4.show()
	if w5 == user_ch:
		word_5.text = "F"
		word_5.show()
	if w6 == user_ch:
		word_6.text = "F"
		word_6.show()
	if w1 != user_ch && w2 != user_ch && w3 != user_ch && w4 != user_ch && w5 != user_ch && w6 != user_ch:
		incorrect += 1
	else:
		correct += 1
	if incorrect == 1:
		head.show()
	elif incorrect == 2:
		body.show()
	elif incorrect == 3:
		l_arm.show()
	elif incorrect == 4:
		r_arm.show()
	elif incorrect == 5:
		l_leg.show()
	elif incorrect == 6:
		r_leg.show()
		result_shown.text = "lose"
		result_shown.show()
	if correct == 6:
		result_shown.text = "win"
		result_shown.show()
	pass # Replace with function body.

func _on_g_pressed():
	G.hide()
	user_ch = 7
	if w1 == user_ch:
		word_1.text = "G"
		word_1.show()
	if w2 == user_ch:
		word_2.text = "G"
		word_2.show()
	if w3 == user_ch:
		word_3.text = "G"
		word_3.show()
	if w4 == user_ch:
		word_4.text = "G"
		word_4.show()
	if w5 == user_ch:
		word_5.text = "G"
		word_5.show()
	if w6 == user_ch:
		word_6.text = "G"
		word_6.show()
	if w1 != user_ch && w2 != user_ch && w3 != user_ch && w4 != user_ch && w5 != user_ch && w6 != user_ch:
		incorrect += 1
	else:
		correct += 1
	if incorrect == 1:
		head.show()
	elif incorrect == 2:
		body.show()
	elif incorrect == 3:
		l_arm.show()
	elif incorrect == 4:
		r_arm.show()
	elif incorrect == 5:
		l_leg.show()
	elif incorrect == 6:
		r_leg.show()
		result_shown.text = "lose"
		result_shown.show()
	if correct == 6:
		result_shown.text = "win"
		result_shown.show()
	pass # Replace with function body.

func _on_h_pressed():
	H.hide()
	user_ch = 8
	if w1 == user_ch:
		word_1.text = "H"
		word_1.show()
	if w2 == user_ch:
		word_2.text = "H"
		word_2.show()
	if w3 == user_ch:
		word_3.text = "H"
		word_3.show()
	if w4 == user_ch:
		word_4.text = "H"
		word_4.show()
	if w5 == user_ch:
		word_5.text = "H"
		word_5.show()
	if w6 == user_ch:
		word_6.text = "H"
		word_6.show()
	if w1 != user_ch && w2 != user_ch && w3 != user_ch && w4 != user_ch && w5 != user_ch && w6 != user_ch:
		incorrect += 1
	else:
		correct += 1
	if incorrect == 1:
		head.show()
	elif incorrect == 2:
		body.show()
	elif incorrect == 3:
		l_arm.show()
	elif incorrect == 4:
		r_arm.show()
	elif incorrect == 5:
		l_leg.show()
	elif incorrect == 6:
		r_leg.show()
		result_shown.text = "lose"
		result_shown.show()
	if correct == 6:
		result_shown.text = "win"
		result_shown.show()
	pass # Replace with function body.

func _on_i_pressed():
	I.hide()
	user_ch = 9
	if w1 == user_ch:
		word_1.text = "I"
		word_1.show()
	if w2 == user_ch:
		word_2.text = "I"
		word_2.show()
	if w3 == user_ch:
		word_3.text = "I"
		word_3.show()
	if w4 == user_ch:
		word_4.text = "I"
		word_4.show()
	if w5 == user_ch:
		word_5.text = "I"
		word_5.show()
	if w6 == user_ch:
		word_6.text = "I"
		word_6.show()
	if w1 != user_ch && w2 != user_ch && w3 != user_ch && w4 != user_ch && w5 != user_ch && w6 != user_ch:
		incorrect += 1
	else:
		correct += 1
	if incorrect == 1:
		head.show()
	elif incorrect == 2:
		body.show()
	elif incorrect == 3:
		l_arm.show()
	elif incorrect == 4:
		r_arm.show()
	elif incorrect == 5:
		l_leg.show()
	elif incorrect == 6:
		r_leg.show()
		result_shown.text = "lose"
		result_shown.show()
	if correct == 6:
		result_shown.text = "win"
		result_shown.show()
	pass # Replace with function body.

func _on_j_pressed():
	J.hide()
	user_ch = 10
	if w1 == user_ch:
		word_1.text = "J"
		word_1.show()
	if w2 == user_ch:
		word_2.text = "J"
		word_2.show()
	if w3 == user_ch:
		word_3.text = "J"
		word_3.show()
	if w4 == user_ch:
		word_4.text = "J"
		word_4.show()
	if w5 == user_ch:
		word_5.text = "J"
		word_5.show()
	if w6 == user_ch:
		word_6.text = "J"
		word_6.show()
	if w1 != user_ch && w2 != user_ch && w3 != user_ch && w4 != user_ch && w5 != user_ch && w6 != user_ch:
		incorrect += 1
	else:
		correct += 1
	if incorrect == 1:
		head.show()
	elif incorrect == 2:
		body.show()
	elif incorrect == 3:
		l_arm.show()
	elif incorrect == 4:
		r_arm.show()
	elif incorrect == 5:
		l_leg.show()
	elif incorrect == 6:
		r_leg.show()
		result_shown.text = "lose"
		result_shown.show()
	if correct == 6:
		result_shown.text = "win"
		result_shown.show()
	pass # Replace with function body.

func _on_k_pressed():
	K.hide()
	user_ch = 11
	if w1 == user_ch:
		word_1.text = "K"
		word_1.show()
	if w2 == user_ch:
		word_2.text = "K"
		word_2.show()
	if w3 == user_ch:
		word_3.text = "K"
		word_3.show()
	if w4 == user_ch:
		word_4.text = "K"
		word_4.show()
	if w5 == user_ch:
		word_5.text = "K"
		word_5.show()
	if w6 == user_ch:
		word_6.text = "K"
		word_6.show()
	if w1 != user_ch && w2 != user_ch && w3 != user_ch && w4 != user_ch && w5 != user_ch && w6 != user_ch:
		incorrect += 1
	else:
		correct += 1
	if incorrect == 1:
		head.show()
	elif incorrect == 2:
		body.show()
	elif incorrect == 3:
		l_arm.show()
	elif incorrect == 4:
		r_arm.show()
	elif incorrect == 5:
		l_leg.show()
	elif incorrect == 6:
		r_leg.show()
		result_shown.text = "lose"
		result_shown.show()
	if correct == 6:
		result_shown.text = "win"
		result_shown.show()
	pass # Replace with function body.

func _on_l_pressed():
	L.hide()
	user_ch = 12
	if w1 == user_ch:
		word_1.text = "L"
		word_1.show()
	if w2 == user_ch:
		word_2.text = "L"
		word_2.show()
	if w3 == user_ch:
		word_3.text = "L"
		word_3.show()
	if w4 == user_ch:
		word_4.text = "L"
		word_4.show()
	if w5 == user_ch:
		word_5.text = "L"
		word_5.show()
	if w6 == user_ch:
		word_6.text = "L"
		word_6.show()
	if w1 != user_ch && w2 != user_ch && w3 != user_ch && w4 != user_ch && w5 != user_ch && w6 != user_ch:
		incorrect += 1
	else:
		correct += 1
	if incorrect == 1:
		head.show()
	elif incorrect == 2:
		body.show()
	elif incorrect == 3:
		l_arm.show()
	elif incorrect == 4:
		r_arm.show()
	elif incorrect == 5:
		l_leg.show()
	elif incorrect == 6:
		r_leg.show()
		result_shown.text = "lose"
		result_shown.show()
	if correct == 6:
		result_shown.text = "win"
		result_shown.show()
	pass # Replace with function body.

func _on_m_pressed():
	M.hide()
	user_ch = 13
	if w1 == user_ch:
		word_1.text = "M"
		word_1.show()
	if w2 == user_ch:
		word_2.text = "M"
		word_2.show()
	if w3 == user_ch:
		word_3.text = "M"
		word_3.show()
	if w4 == user_ch:
		word_4.text = "M"
		word_4.show()
	if w5 == user_ch:
		word_5.text = "M"
		word_5.show()
	if w6 == user_ch:
		word_6.text = "M"
		word_6.show()
	if w1 != user_ch && w2 != user_ch && w3 != user_ch && w4 != user_ch && w5 != user_ch && w6 != user_ch:
		incorrect += 1
	else:
		correct += 1
	if incorrect == 1:
		head.show()
	elif incorrect == 2:
		body.show()
	elif incorrect == 3:
		l_arm.show()
	elif incorrect == 4:
		r_arm.show()
	elif incorrect == 5:
		l_leg.show()
	elif incorrect == 6:
		r_leg.show()
		result_shown.text = "lose"
		result_shown.show()
	if correct == 6:
		result_shown.text = "win"
		result_shown.show()
	pass # Replace with function body.

func _on_n_pressed():
	N.hide()
	user_ch = 14
	if w1 == user_ch:
		word_1.text = "N"
		word_1.show()
	if w2 == user_ch:
		word_2.text = "N"
		word_2.show()
	if w3 == user_ch:
		word_3.text = "N"
		word_3.show()
	if w4 == user_ch:
		word_4.text = "N"
		word_4.show()
	if w5 == user_ch:
		word_5.text = "N"
		word_5.show()
	if w6 == user_ch:
		word_6.text = "N"
		word_6.show()
	if w1 != user_ch && w2 != user_ch && w3 != user_ch && w4 != user_ch && w5 != user_ch && w6 != user_ch:
		incorrect += 1
	else:
		correct += 1
	if incorrect == 1:
		head.show()
	elif incorrect == 2:
		body.show()
	elif incorrect == 3:
		l_arm.show()
	elif incorrect == 4:
		r_arm.show()
	elif incorrect == 5:
		l_leg.show()
	elif incorrect == 6:
		r_leg.show()
		result_shown.text = "lose"
		result_shown.show()
	if correct == 6:
		result_shown.text = "win"
		result_shown.show()
	pass # Replace with function body.

func _on_o_pressed():
	O.hide()
	user_ch = 15
	if w1 == user_ch:
		word_1.text = "O"
		word_1.show()
	if w2 == user_ch:
		word_2.text = "O"
		word_2.show()
	if w3 == user_ch:
		word_3.text = "O"
		word_3.show()
	if w4 == user_ch:
		word_4.text = "O"
		word_4.show()
	if w5 == user_ch:
		word_5.text = "O"
		word_5.show()
	if w6 == user_ch:
		word_6.text = "O"
		word_6.show()
	if w1 != user_ch && w2 != user_ch && w3 != user_ch && w4 != user_ch && w5 != user_ch && w6 != user_ch:
		incorrect += 1
	else:
		correct += 1
	if incorrect == 1:
		head.show()
	elif incorrect == 2:
		body.show()
	elif incorrect == 3:
		l_arm.show()
	elif incorrect == 4:
		r_arm.show()
	elif incorrect == 5:
		l_leg.show()
	elif incorrect == 6:
		r_leg.show()
		result_shown.text = "lose"
		result_shown.show()
	if correct == 6:
		result_shown.text = "win"
		result_shown.show()
	pass # Replace with function body.

func _on_p_pressed():
	P.hide()
	user_ch = 16
	if w1 == user_ch:
		word_1.text = "P"
		word_1.show()
	if w2 == user_ch:
		word_2.text = "P"
		word_2.show()
	if w3 == user_ch:
		word_3.text = "P"
		word_3.show()
	if w4 == user_ch:
		word_4.text = "P"
		word_4.show()
	if w5 == user_ch:
		word_5.text = "P"
		word_5.show()
	if w6 == user_ch:
		word_6.text = "P"
		word_6.show()
	if w1 != user_ch && w2 != user_ch && w3 != user_ch && w4 != user_ch && w5 != user_ch && w6 != user_ch:
		incorrect += 1
	else:
		correct += 1
	if incorrect == 1:
		head.show()
	elif incorrect == 2:
		body.show()
	elif incorrect == 3:
		l_arm.show()
	elif incorrect == 4:
		r_arm.show()
	elif incorrect == 5:
		l_leg.show()
	elif incorrect == 6:
		r_leg.show()
		result_shown.text = "lose"
		result_shown.show()
	if correct == 6:
		result_shown.text = "win"
		result_shown.show()
	pass # Replace with function body.

func _on_q_pressed():
	Q.hide()
	user_ch = 17
	if w1 == user_ch:
		word_1.text = "Q"
		word_1.show()
	if w2 == user_ch:
		word_2.text = "Q"
		word_2.show()
	if w3 == user_ch:
		word_3.text = "Q"
		word_3.show()
	if w4 == user_ch:
		word_4.text = "Q"
		word_4.show()
	if w5 == user_ch:
		word_5.text = "Q"
		word_5.show()
	if w6 == user_ch:
		word_6.text = "Q"
		word_6.show()
	if w1 != user_ch && w2 != user_ch && w3 != user_ch && w4 != user_ch && w5 != user_ch && w6 != user_ch:
		incorrect += 1
	else:
		correct += 1
	if incorrect == 1:
		head.show()
	elif incorrect == 2:
		body.show()
	elif incorrect == 3:
		l_arm.show()
	elif incorrect == 4:
		r_arm.show()
	elif incorrect == 5:
		l_leg.show()
	elif incorrect == 6:
		r_leg.show()
		result_shown.text = "lose"
		result_shown.show()
	if correct == 6:
		result_shown.text = "win"
		result_shown.show()
	pass # Replace with function body.

func _on_r_pressed():
	R.hide()
	user_ch = 18
	if w1 == user_ch:
		word_1.text = "R"
		word_1.show()
	if w2 == user_ch:
		word_2.text = "R"
		word_2.show()
	if w3 == user_ch:
		word_3.text = "R"
		word_3.show()
	if w4 == user_ch:
		word_4.text = "R"
		word_4.show()
	if w5 == user_ch:
		word_5.text = "R"
		word_5.show()
	if w6 == user_ch:
		word_6.text = "R"
		word_6.show()
	if w1 != user_ch && w2 != user_ch && w3 != user_ch && w4 != user_ch && w5 != user_ch && w6 != user_ch:
		incorrect += 1
	else:
		correct += 1
	if incorrect == 1:
		head.show()
	elif incorrect == 2:
		body.show()
	elif incorrect == 3:
		l_arm.show()
	elif incorrect == 4:
		r_arm.show()
	elif incorrect == 5:
		l_leg.show()
	elif incorrect == 6:
		r_leg.show()
		result_shown.text = "lose"
		result_shown.show()
	if correct == 6:
		result_shown.text = "win"
		result_shown.show()
	pass # Replace with function body.

func _on_s_pressed():
	S.hide()
	user_ch = 19
	if w1 == user_ch:
		word_1.text = "S"
		word_1.show()
	if w2 == user_ch:
		word_2.text = "S"
		word_2.show()
	if w3 == user_ch:
		word_3.text = "S"
		word_3.show()
	if w4 == user_ch:
		word_4.text = "S"
		word_4.show()
	if w5 == user_ch:
		word_5.text = "S"
		word_5.show()
	if w6 == user_ch:
		word_6.text = "S"
		word_6.show()
	if w1 != user_ch && w2 != user_ch && w3 != user_ch && w4 != user_ch && w5 != user_ch && w6 != user_ch:
		incorrect += 1
	else:
		correct += 1
	if incorrect == 1:
		head.show()
	elif incorrect == 2:
		body.show()
	elif incorrect == 3:
		l_arm.show()
	elif incorrect == 4:
		r_arm.show()
	elif incorrect == 5:
		l_leg.show()
	elif incorrect == 6:
		r_leg.show()
		result_shown.text = "lose"
		result_shown.show()
	if correct == 6:
		result_shown.text = "win"
		result_shown.show()
	pass # Replace with function body.

func _on_t_pressed():
	T.hide()
	user_ch = 20
	if w1 == user_ch:
		word_1.text = "T"
		word_1.show()
	if w2 == user_ch:
		word_2.text = "T"
		word_2.show()
	if w3 == user_ch:
		word_3.text = "T"
		word_3.show()
	if w4 == user_ch:
		word_4.text = "T"
		word_4.show()
	if w5 == user_ch:
		word_5.text = "T"
		word_5.show()
	if w6 == user_ch:
		word_6.text = "T"
		word_6.show()
	if w1 != user_ch && w2 != user_ch && w3 != user_ch && w4 != user_ch && w5 != user_ch && w6 != user_ch:
		incorrect += 1
	else:
		correct += 1
	if incorrect == 1:
		head.show()
	elif incorrect == 2:
		body.show()
	elif incorrect == 3:
		l_arm.show()
	elif incorrect == 4:
		r_arm.show()
	elif incorrect == 5:
		l_leg.show()
	elif incorrect == 6:
		r_leg.show()
		result_shown.text = "lose"
		result_shown.show()
	if correct == 6:
		result_shown.text = "win"
		result_shown.show()
	pass # Replace with function body.

func _on_u_pressed():
	U.hide()
	user_ch = 21
	if w1 == user_ch:
		word_1.text = "U"
		word_1.show()
	if w2 == user_ch:
		word_2.text = "U"
		word_2.show()
	if w3 == user_ch:
		word_3.text = "U"
		word_3.show()
	if w4 == user_ch:
		word_4.text = "U"
		word_4.show()
	if w5 == user_ch:
		word_5.text = "U"
		word_5.show()
	if w6 == user_ch:
		word_6.text = "U"
		word_6.show()
	if w1 != user_ch && w2 != user_ch && w3 != user_ch && w4 != user_ch && w5 != user_ch && w6 != user_ch:
		incorrect += 1
	else:
		correct += 1
	if incorrect == 1:
		head.show()
	elif incorrect == 2:
		body.show()
	elif incorrect == 3:
		l_arm.show()
	elif incorrect == 4:
		r_arm.show()
	elif incorrect == 5:
		l_leg.show()
	elif incorrect == 6:
		r_leg.show()
		result_shown.text = "lose"
		result_shown.show()
	if correct == 6:
		result_shown.text = "win"
		result_shown.show()
	pass # Replace with function body.

func _on_v_pressed():
	V.hide()
	user_ch = 22
	if w1 == user_ch:
		word_1.text = "V"
		word_1.show()
	if w2 == user_ch:
		word_2.text = "V"
		word_2.show()
	if w3 == user_ch:
		word_3.text = "V"
		word_3.show()
	if w4 == user_ch:
		word_4.text = "V"
		word_4.show()
	if w5 == user_ch:
		word_5.text = "V"
		word_5.show()
	if w6 == user_ch:
		word_6.text = "V"
		word_6.show()
	if w1 != user_ch && w2 != user_ch && w3 != user_ch && w4 != user_ch && w5 != user_ch && w6 != user_ch:
		incorrect += 1
	else:
		correct += 1
	if incorrect == 1:
		head.show()
	elif incorrect == 2:
		body.show()
	elif incorrect == 3:
		l_arm.show()
	elif incorrect == 4:
		r_arm.show()
	elif incorrect == 5:
		l_leg.show()
	elif incorrect == 6:
		r_leg.show()
		result_shown.text = "lose"
		result_shown.show()
	if correct == 6:
		result_shown.text = "win"
		result_shown.show()
	pass # Replace with function body.

func _on_w_pressed():
	W.hide()
	user_ch = 23
	if w1 == user_ch:
		word_1.text = "W"
		word_1.show()
	if w2 == user_ch:
		word_2.text = "W"
		word_2.show()
	if w3 == user_ch:
		word_3.text = "W"
		word_3.show()
	if w4 == user_ch:
		word_4.text = "W"
		word_4.show()
	if w5 == user_ch:
		word_5.text = "W"
		word_5.show()
	if w6 == user_ch:
		word_6.text = "W"
		word_6.show()
	if w1 != user_ch && w2 != user_ch && w3 != user_ch && w4 != user_ch && w5 != user_ch && w6 != user_ch:
		incorrect += 1
	else:
		correct += 1
	if incorrect == 1:
		head.show()
	elif incorrect == 2:
		body.show()
	elif incorrect == 3:
		l_arm.show()
	elif incorrect == 4:
		r_arm.show()
	elif incorrect == 5:
		l_leg.show()
	elif incorrect == 6:
		r_leg.show()
		result_shown.text = "lose"
		result_shown.show()
	if correct == 6:
		result_shown.text = "win"
		result_shown.show()
	pass # Replace with function body.
	
func _on_x_pressed():
	X.hide()
	user_ch = 24
	if w1 == user_ch:
		word_1.text = "X"
		word_1.show()
	if w2 == user_ch:
		word_2.text = "X"
		word_2.show()
	if w3 == user_ch:
		word_3.text = "X"
		word_3.show()
	if w4 == user_ch:
		word_4.text = "X"
		word_4.show()
	if w5 == user_ch:
		word_5.text = "X"
		word_5.show()
	if w6 == user_ch:
		word_6.text = "X"
		word_6.show()
	if w1 != user_ch && w2 != user_ch && w3 != user_ch && w4 != user_ch && w5 != user_ch && w6 != user_ch:
		incorrect += 1
	else:
		correct += 1
	if incorrect == 1:
		head.show()
	elif incorrect == 2:
		body.show()
	elif incorrect == 3:
		l_arm.show()
	elif incorrect == 4:
		r_arm.show()
	elif incorrect == 5:
		l_leg.show()
	elif incorrect == 6:
		r_leg.show()
		result_shown.text = "lose"
		result_shown.show()
	if correct == 6:
		result_shown.text = "win"
		result_shown.show()
	pass # Replace with function body.

func _on_y_pressed():
	Y.hide()
	user_ch = 25
	if w1 == user_ch:
		word_1.text = "Y"
		word_1.show()
	if w2 == user_ch:
		word_2.text = "Y"
		word_2.show()
	if w3 == user_ch:
		word_3.text = "Y"
		word_3.show()
	if w4 == user_ch:
		word_4.text = "Y"
		word_4.show()
	if w5 == user_ch:
		word_5.text = "Y"
		word_5.show()
	if w6 == user_ch:
		word_6.text = "Y"
		word_6.show()
	if w1 != user_ch && w2 != user_ch && w3 != user_ch && w4 != user_ch && w5 != user_ch && w6 != user_ch:
		incorrect += 1
	else:
		correct += 1
	if incorrect == 1:
		head.show()
	elif incorrect == 2:
		body.show()
	elif incorrect == 3:
		l_arm.show()
	elif incorrect == 4:
		r_arm.show()
	elif incorrect == 5:
		l_leg.show()
	elif incorrect == 6:
		r_leg.show()
		result_shown.text = "lose"
		result_shown.show()
	if correct == 6:
		result_shown.text = "win"
		result_shown.show()
	pass # Replace with function body.

func _on_z_pressed():
	Z.hide()
	user_ch = 26
	if w1 == user_ch:
		word_1.text = "Z"
		word_1.show()
	if w2 == user_ch:
		word_2.text = "Z"
		word_2.show()
	if w3 == user_ch:
		word_3.text = "Z"
		word_3.show()
	if w4 == user_ch:
		word_4.text = "Z"
		word_4.show()
	if w5 == user_ch:
		word_5.text = "Z"
		word_5.show()
	if w6 == user_ch:
		word_6.text = "Z"
		word_6.show()
	if w1 != user_ch && w2 != user_ch && w3 != user_ch && w4 != user_ch && w5 != user_ch && w6 != user_ch:
		incorrect += 1
	else:
		correct += 1
	if incorrect == 1:
		head.show()
	elif incorrect == 2:
		body.show()
	elif incorrect == 3:
		l_arm.show()
	elif incorrect == 4:
		r_arm.show()
	elif incorrect == 5:
		l_leg.show()
	elif incorrect == 6:
		r_leg.show()
		result_shown.text = "lose"
		result_shown.show()
	if correct == 6:
		result_shown.text = "win"
		result_shown.show()
	pass # Replace with function body.
