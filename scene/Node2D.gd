extends Node2D
 
const Player = preload("res://scene/player.tscn")
const JoinScreen = preload("res://scene/join_screen.tscn")
const MainPage = preload("res://scene/main_scene.tscn")

@onready var _background = $ParallaxBackground/TextureRect
@onready var _main_menu = $"main menu"
@onready var _host_butt = $"main menu/TextureRect3/Main Menu/MarginContainer/Buttons/HostButt"
@onready var _join_butt = $"main menu/TextureRect3/Main Menu/MarginContainer/Buttons/JoinButt"
@onready var _connect_butt = $"main menu/TextureRect3/Main Menu/MarginContainer/Join Info/VBoxContainer/connect butt"
@onready var _name_edit = $"main menu/TextureRect3/Main Menu/MarginContainer/Buttons/name"
@onready var _host_edit = $"main menu/TextureRect3/Main Menu/MarginContainer/Join Info/VBoxContainer/host name"
@onready var _join_info = $"main menu/TextureRect3/Main Menu/MarginContainer/Join Info"
@onready var _menu_butts = $"main menu/TextureRect3/Main Menu/MarginContainer/Buttons"
@onready var _disconnect_butt = $"main menu/disconnect"
@onready var _game = $game
@onready var multiplayerPeer = ENetMultiplayerPeer.new()

const PORT = 4712
const proto_name = "dicey"
var peer = null

func _unhandled_input(event):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

func _ready():
	#warning-ignore-all:return_value_discarded
	multiplayer.connect("peer_disconnected",Callable(self,"_peer_disconnected"))
	multiplayer.connect("peer_connected",Callable(self,"_peer_connected"))
	
	#$AcceptDialog.get_label().horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	#$AcceptDialog.get_label().vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	
	# Set the player name according to the system username. Fallback to the path.
	if OS.has_environment("USERNAME"):
		_name_edit.text = OS.get_environment("USERNAME")
	else:
		var desktop_path = OS.get_system_dir(OS.SYSTEM_DIR_DESKTOP).replace("\\", "/").split("/")
		_name_edit.text = desktop_path[desktop_path.size() - 2]

func start_game():
	_main_menu.hide()
	_game.start()

func start_board():
	_main_menu.hide()
	_game.start()

func stop_game():
	_main_menu.show()
	_join_info.hide()
	_game.stop()
	
func _close_network():
	
	if multiplayer.is_connected("server_disconnected",Callable(self,"_close_network")):
		multiplayer.disconnect("server_disconnected",Callable(self,"_close_network"))
	if multiplayer.is_connected("connection_failed",Callable(self,"_close_network")):
		multiplayer.disconnect("connection_failed",Callable(self,"_close_network"))
	if multiplayer.is_connected("connected_to_server",Callable(self,"_connected")):
		multiplayer.disconnect("connected_to_server",Callable(self,"_connected"))
	
	multiplayerPeer.close()
	multiplayerPeer = ENetMultiplayerPeer.new()

	stop_game()
	#$AcceptDialog.show()
	#$AcceptDialog.get_ok_button().grab_focus()

func _connected():
	_game.rpc("set_player_name", _name_edit.text)

func _peer_connected(id):
	_game.on_peer_add(id)

func _peer_disconnected(id):
	_game.on_peer_del(id)
	if id==1:
		_close_network()

func _on_host_butt_pressed():
	multiplayerPeer.create_server(PORT)
	
	if multiplayerPeer.get_connection_status()==MultiplayerPeer.CONNECTION_DISCONNECTED:
		OS.alert("Connection Failed")
		return
	
	multiplayer.connect("server_disconnected",Callable(self,"_close_network"))
	multiplayer.set_multiplayer_peer(multiplayerPeer)
	
	_game.add_player(1, _name_edit.text)
	
	start_board()

func _on_join_butt_pressed():
	_menu_butts.hide()
	_join_info.show()


func _on_disconnect_pressed():
	_close_network()

func _on_connect_butt_pressed():
	var txt= _host_edit.text
	
	if txt=="":
		OS.alert("Needs host to connect to")
		return
	multiplayerPeer.create_client(txt,PORT)
	multiplayer.connect("connection_failed",Callable(self,"_close_network"))
	multiplayer.connect("connected_to_server",Callable(self,"_connected"))

	multiplayer.set_multiplayer_peer(multiplayerPeer)
	start_game()




 



