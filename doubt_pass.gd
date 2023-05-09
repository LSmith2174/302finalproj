extends Control

@onready var doubtButt = $"Doubt or Pass/DPbuttons/doubt"
@onready var passButt = $"Doubt or Pass/DPbuttons/pass"
@onready var DPUI = $"Doubt or Pass"

signal DorP(Doubt)
@export var Doubt = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func start():
	DPUI.show()

func _on_doubt_pressed():
	DPUI.hide()
	Doubt = 1
	DorP.emit(Doubt)
	


func _on_pass_pressed():
	DPUI.hide()
	DorP.emit(Doubt)
	
