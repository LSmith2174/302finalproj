extends Control

signal move(dice)

#the parts of the UI screen
@onready var roll_butt = $roll_butt
@onready var dice_num = $"lie or truth/dice_num"
@onready var message = $"lie or truth/message"
@onready var decision = $"lie or truth"
@onready var decision_lie = $they_lie
@onready var decide_butts = $"lie or truth/decide_TOL"
@onready var ok_butt = $"lie or truth/ok"
@onready var DP = $DoubtPass


var rng = RandomNumberGenerator.new()
@export var dice = rng.randi_range(1, 6)

func _ready():
	roll_butt.show()
	dice = rng.randi_range(1, 6) #generates random number as in a dice roll


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _not_turn(): #in progress, supposed to show the doupt/pass to the player's who aren't rolling
	DP.show()
	reset()

func _on_roll_butt_pressed(): #hides roll button and shows the player the roll
	roll_butt.hide()
	decision.show()
	ok_butt.hide()
	
	if dice != 6: #if 1-5 then they get to choose to lie or tell the truth
		dice_num.text = str(dice)
		message.text = "Will you lie or tell the truth about what you rolled?"
		decide_butts.show()
		ok_butt.hide()
	else: #otherwise they must lie
		message.text = "You Must Lie"
		dice_num.text = "X"
		decide_butts.hide()
		ok_butt.show()

func _on_ok_pressed(): #hides decision buttons and shows lie buttons
	decision.hide()
	decision_lie.show()

func _on_lie_pressed(): #same as above
	decision.hide()
	decision_lie.show()

func _on_truth_pressed(): #hides buttons and emits dice and resets scene
	decision.hide()
	move.emit(dice)
	reset()


#lie buttons, all set dice to number, hide buttons, send number and reset the scene
func _on_1_pressed():
	dice = 1
	decision_lie.hide()
	move.emit(dice)
	reset()


func _on_2_pressed():
	dice = 2
	decision_lie.hide()
	move.emit(dice)
	reset()


func _on_3_pressed():
	dice = 3
	decision_lie.hide()
	move.emit(dice)
	reset()


func _on_4_pressed():
	dice = 4
	decision_lie.hide()
	move.emit(dice)
	reset()


func _on_5_pressed():
	dice = 5
	decision_lie.hide()
	move.emit(dice)
	reset()

func reset():
	roll_butt.hide()
	decision.hide()
	decision_lie.hide()
	DP.hide()

