extends Node2D

@onready var Player_child = $Player
@onready var roll_scene = $CanvasLayer/Roll
@onready var Canvas_layer = $CanvasLayer


func _enter_tree():
	set_multiplayer_authority(str(name).to_int())

# Called when the node enters the scene tree for the first time.
func _ready():
	if not is_multiplayer_authority():
		Canvas_layer.visible = 0

	if not get_parent().is_multiplayer_authority():
		visible = 0

#	var rolls = get_node("Control")	
#	roll_scene.move.connect("_on_control_move")
	
	pass # Replace with function body.
 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_one_button_down():
	Player_child.move_to_index()
	pass # Replace with function body.


func _on_two_button_down():
	Player_child.move_to_index(2)
	pass # Replace with function body.


func _on_three_button_down():
	Player_child.move_to_index(3)
	pass # Replace with function body.


func _on_four_button_down():
	Player_child.move_to_index(4)
	pass # Replace with function body.


func _on_five_button_down():
	Player_child.move_to_index(5)
	pass # Replace with function body.



func _on_control_move(dice):
	Player_child.move_to_index(dice)
	pass # Replace with function body.
