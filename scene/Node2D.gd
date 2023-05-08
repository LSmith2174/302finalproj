extends Node2D

func _unhandled_input(event):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
		

const Player = preload("res://scene/player.tscn")
const JoinScreen = preload("res://scene/join_screen.tscn")
const MainPage = preload("res://scene/main_scene.tscn")

@onready var main_menu = $"CanvasLayer/TextureRect3"
@onready var title = $"CanvasLayer/TextureRect2"
@onready var main_menuBG = $ParallaxBackground/TextureRect

const PORT = 4712
var enet_peer = ENetMultiplayerPeer.new()

# Player info, associate ID to data
#@export var player_info = {}

#func _player_disconnected(id):
#	player_info.erase(id) # Erase player from info.

#@rpc("call_remote") func register_player(info):
	# Get the id of the RPC sender.
#	var id = multiplayer.get_remote_sender_id()
	# Store the info
#	player_info[id] = info
	
func _on_host_butt_pressed():
	main_menu.hide()
	title.hide()
	main_menuBG.hide()
	
	enet_peer.create_server(PORT, 5)
	multiplayer.multiplayer_peer = enet_peer
	multiplayer.peer_connected.connect(join_board)
	
	add_board(multiplayer.get_unique_id())
	
	


func _on_join_butt_pressed():
	main_menu.hide()
	title.hide()
	
	enet_peer.create_client("localhost", PORT)
	multiplayer.multiplayer_peer = enet_peer
	
	#join_board(multiplayer.get_unique_id())
	
func join_board(peer_id):
	var screen = JoinScreen.instantiate()
	screen.name = str(peer_id)
	#rpc_id(peer_id, "register_player", screen)
	add_child(screen)
	
	

#func add_player(peer_id):
#	var player = Player.instantiate()
#	player.name = str(peer_id)
#	add_child(player)

func add_board(peer_id):
	var board = MainPage.instantiate()
	
	board.name = str(peer_id)
	set_multiplayer_authority(peer_id)
	add_child(board)


#func _on_roll_butt_pressed():
#	var rng = RandomNumberGenerator.new()
#	print("Press")
#	var dice_1 = rng.randi_range(0, 6)
#	var dice_2 = rng.randi_range(0, 6)
#	print(rng.randi_range(0, 6), rng.randi_range(0, 6))
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

