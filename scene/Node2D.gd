extends Node2D

func _unhandled_input(event):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
		

const Player = preload("res://scene/Player.tscn")

@onready var main_menu = $"CanvasLayer/Main Menu"
@onready var main_menuBG = $CanvasLayer/TextureRect
@onready var address_entry = $"../CanvasLayer/Main Menu/MarginContainer/VBoxContainer/RoomCode"

const PORT = 4712
var enet_peer = ENetMultiplayerPeer.new()

func _on_host_butt_pressed():
	main_menu.hide()
	main_menuBG.hide()
	
	enet_peer.create_server(PORT)
	multiplayer.multiplayer_peer = enet_peer
	
	add_player(multiplayer.get_unique_id())


func _on_join_butt_pressed():
	main_menu.hide()
	main_menuBG.hide()
	
func add_player(peer_id):
	var player = Player.instantiate()
	player.name = str(peer_id)
	add_child(player)


#func _on_roll_butt_pressed():
#	var rng = RandomNumberGenerator.new()
#	print("Press")
#	var dice_1 = rng.randi_range(0, 6)
#	var dice_2 = rng.randi_range(0, 6)
#	print(rng.randi_range(0, 6), rng.randi_range(0, 6))
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

