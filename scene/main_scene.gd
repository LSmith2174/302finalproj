extends Node2D

signal playernum(numplayer)

func _enter_tree():
	set_multiplayer_authority(str(name).to_int())

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_player_num():
	var numplayer = 2
	
	playernum.emit(numplayer)
