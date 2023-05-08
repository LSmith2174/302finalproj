extends Node2D

@onready var Player_child = $Player
@onready var roll_scene = $CanvasLayer/Roll
@onready var Canvas_layer = $CanvasLayer
@export var playernum = int()


func _enter_tree():
	set_multiplayer_authority(str(name).to_int())
	

# Called when the node enters the scene tree for the first time.
func _ready():
	if not is_multiplayer_authority():
		Canvas_layer.visible = 0

	if not get_parent().is_multiplayer_authority():
		visible = 0
		
	#move_offset()

#	var rolls = get_node("Control")	
#	roll_scene.move.connect("_on_control_move")
	
	pass # Replace with function body.
 
func move_offset():
	#get number of player nodes and then move player by an offeset amount
	#Player_child.move_to_index(1)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_control_move(dice):
	Player_child.move_to_index(dice)
	pass # Replace with function body.
