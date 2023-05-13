extends Node2D

@onready var roll_scene = $CanvasLayer/Roll
@onready var DP_scene = $CanvasLayer/DoubtPass
@onready var Canvas_layer = $CanvasLayer
@export var playernum = int()
signal roll(dice)


func move_offset():
	#get number of player nodes and then move player by an offeset amount
	#Player_child.move_to_index(1)
	pass

func _on_control_move(dice):
	roll.emit(dice)
	
# this function is called when a player is added and needs to have the join screen be displayed
func start():
	if is_multiplayer_authority():
		$CanvasLayer.visible = 1

# show the join sceen when needed
func roll_turn(id):
		roll_scene.show()
		roll_scene._ready()
		
# hide it when not turn
func _not_turn(id):
		roll_scene._not_turn()
