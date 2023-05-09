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
	

func start():
	if is_multiplayer_authority():
		$CanvasLayer.visible = 1

func roll_turn(id):
	#if id == multiplayer.get_unique_id():
		roll_scene.show()
		roll_scene._ready()
		
func _not_turn(id):
	#if id == multiplayer.get_unique_id():
		roll_scene._not_turn()
