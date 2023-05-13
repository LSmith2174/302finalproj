extends Node2D

var player = preload("res://scene/player.tscn") #preload's player token

func _ready():
	pass

func start(): #makes the board visible
	if is_multiplayer_authority():
		visible = 1
		$board.visible = 1

func _process(delta):
	pass

# adds a player child to the player list child node to keep track of them. Name them the id
func add_player(id, num):
	var play = player.instantiate()
	play.name = id
	$"board/Player-list".add_child(play)
	play._find_offset(num)
