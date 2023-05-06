extends Control

signal move(dice)

@onready var RollButt = $roll_butt
@onready var dice_num = $"lie or truth/dice_num"
@onready var message = $"lie or truth/message"
@onready var decision = $"lie or truth"
@onready var decision_lie = $they_lie
@onready var decide_butts = $"lie or truth/decide_TOL"
@onready var ok_butt = $"lie or truth/ok"
# Called when the node enters the scene tree for the first time.

var rng = RandomNumberGenerator.new()
@export var dice = rng.randi_range(1, 6)

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_roll_butt_pressed():
	RollButt.hide()
	decision.show()
	ok_butt.hide()
	
	if dice != 6:
		dice_num.text = str(dice)
	else:
		message.text = "You Must Lie"
		dice_num.text = "X"
		decide_butts.hide()
		ok_butt.show()

func _on_ok_pressed():
	decision.hide()

func _on_lie_pressed():
	decision.hide()
	decision_lie.show()

func _on_truth_pressed():
	decision.hide()
	move.emit(dice)



func _on_1_pressed():
	dice = 1
	decision_lie.hide()
	move.emit(dice)


func _on_2_pressed():
	dice = 2
	decision_lie.hide()
	move.emit(dice)


func _on_3_pressed():
	dice = 3
	decision_lie.hide()
	move.emit(dice)


func _on_4_pressed():
	dice = 4
	decision_lie.hide()
	move.emit(dice)


func _on_5_pressed():
	dice = 5
	decision_lie.hide()
	move.emit(dice)



