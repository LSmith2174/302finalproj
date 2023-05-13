extends Control

#in progress!!

#the parts of the scene, which re just two buttons and a message currently
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

func start(): #shows buttons
	DPUI.show()

func _on_doubt_pressed(): #adds 1 to the doubt count
	DPUI.hide()
	Doubt = 1
	DorP.emit(Doubt)
	


func _on_pass_pressed(): #just hides buttons and doesn't change the doubt count
	DPUI.hide()
	DorP.emit(Doubt)
	
