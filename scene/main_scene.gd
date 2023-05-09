extends Node2D

signal playernum(numplayer)



var player = preload("res://scene/player.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start():
	if is_multiplayer_authority():
		visible = 1
		$board.visible = 1
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func add_player(id, num):
	var play = player.instantiate()
	play.name = id
	$"board/Player-list".add_child(play)
	play._find_offset(num)
