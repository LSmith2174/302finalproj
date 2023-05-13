#############################################################################################################################################################
#This Node is the multiplayer set up/ main menu screen. This node sets up the multiplayer and then initiates either the player's screen or the game board.
#I used https://godotengine.org/asset-library/asset/540 to set up the logic of the multiplayer, but of course it needed to be converted into 4.0 since the
#tutorial was in v3.5 but the game is built in the 4.0 version. The code takes a name of the player, then if they hit host that name is the host and creates
#a multiplayer instance and then shows the game board. If they hit join, they're asked for a host, which when running the debugger will be Local Host, and 
#will create a new player node on the game board and initiate a join screen for the player to interact with the game. 
#############################################################################################################################################################

extends Node2D #this means this code is for use with Node2D scene and it's children

###################################################################################################################

#my const scenes, to add a scene as a child it needs to be preloaded
const Player = preload("res://scene/player.tscn") #player's token
const JoinScreen = preload("res://scene/join_screen.tscn") #player's UI 
const MainPage = preload("res://scene/main_scene.tscn") #the game board

###################################################################################################################
#variables that connect to objects in the scene:

@onready var _background = $ParallaxBackground/TextureRect #wood background
@onready var _main_menu = $"main menu" #map and the buttons/line edits that make up the main menu options

@onready var _host_butt = $"main menu/TextureRect3/Main Menu/MarginContainer/Buttons/HostButt" 
@onready var _join_butt = $"main menu/TextureRect3/Main Menu/MarginContainer/Buttons/JoinButt"
@onready var _connect_butt = $"main menu/TextureRect3/Main Menu/MarginContainer/Join Info/VBoxContainer/connect butt"
@onready var _menu_butts = $"main menu/TextureRect3/Main Menu/MarginContainer/Buttons" #host, join, and name edit
@onready var _disconnect_butt = $"main menu/disconnect" #not yet implemented, supposed to be always in the top corner 

@onready var _name_edit = $"main menu/TextureRect3/Main Menu/MarginContainer/Buttons/name" #where they type the name
@onready var _host_edit = $"main menu/TextureRect3/Main Menu/MarginContainer/Join Info/VBoxContainer/host name" #where you type the host room code
@onready var _join_info = $"main menu/TextureRect3/Main Menu/MarginContainer/Join Info" #host name edit and connect button

@onready var _game = $game #the game scene

@onready var multiplayerPeer = ENetMultiplayerPeer.new() #variable to make a new multiplayer peer/ player
##################################################################################################################
#each multiplayer instance needs these values, for the port I chose an arbitrary number 

const PORT = 4712
const proto_name = "dicey"
var peer = null

###################################################################################################################
#a player can exit with the esc key at any time

func _unhandled_input(event):
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()

###################################################################################################################
#ready creates multiplayer names, start game starts the game node and hides the main menu
#start board does the same thing, but I created two so that it'd be easier to add things in the 
#future

func _ready():
	multiplayer.connect("peer_disconnected",Callable(self,"_peer_disconnected"))
	multiplayer.connect("peer_connected",Callable(self,"_peer_connected"))
	
	# Set the player name according to the system username. Fallback to the path.
	if OS.has_environment("USERNAME"):
		_name_edit.text = OS.get_environment("USERNAME")
	else:
		var desktop_path = OS.get_system_dir(OS.SYSTEM_DIR_DESKTOP).replace("\\", "/").split("/")
		_name_edit.text = desktop_path[desktop_path.size() - 2]

func start_game():
	_main_menu.hide() #hideds the main menu
	_game.start() #starts the game node

func start_board():
	_main_menu.hide()
	_game.start()

func stop_game():
	_main_menu.show() #brings the player back to main menu
	_join_info.hide() #makes sure the join->connect scene is hidden
	_game.stop() #stops the game node in which the players are using to play

###################################################################################################################
#close network closes down the whole game network, disconnects the players and board and closes the multiplayer
#peer and creates and new blank peer before stopping the game entirely. 

func _close_network():
	if multiplayer.is_connected("server_disconnected",Callable(self,"_close_network")):
		multiplayer.disconnect("server_disconnected",Callable(self,"_close_network"))
	if multiplayer.is_connected("connection_failed",Callable(self,"_close_network")):
		multiplayer.disconnect("connection_failed",Callable(self,"_close_network"))
	if multiplayer.is_connected("connected_to_server",Callable(self,"_connected")):
		multiplayer.disconnect("connected_to_server",Callable(self,"_connected"))
	#disconnects the players from the network and makes sure that it get disconnected
	
	multiplayerPeer.close() #closes the multiplayer peer
	multiplayerPeer = ENetMultiplayerPeer.new() #creates a new blank peer

	stop_game() #stops game

func _connected(): #when a player is connected, it sets the name with the one entered on join/host
	_game.rpc("set_player_name", _name_edit.text) #used rpc (remote player control I think) to give the game node the name variable

func _peer_connected(id): #adds the conncected player to the game and connects it's id to a player sprite and join screen
	_game.on_peer_add(id)

func _peer_disconnected(id): #when a player disconnects, it takes their player out of the game, if it's the host it ends the game
	_game.on_peer_del(id)
	if id==1: #the host's id is 1
		_close_network()

###################################################################################################################
#here are what the buttons do, host, join, and connect and disconnect in the future

func _on_host_butt_pressed():
	multiplayerPeer.create_server(PORT) #creates a server based on a set port number
	
	if multiplayerPeer.get_connection_status()==MultiplayerPeer.CONNECTION_DISCONNECTED:#if it can't connect will alert connection failed
		OS.alert("Connection Failed")
		return
	
	multiplayer.connect("server_disconnected",Callable(self,"_close_network"))#connect rpc functions and set the multiplayer peer of the host
	multiplayer.set_multiplayer_peer(multiplayerPeer)
	
	_game.add_player(1, _name_edit.text) #adds a player
	
	start_board() #goes to the game board

func _on_join_butt_pressed():
	_menu_butts.hide() #hides join/hide
	_join_info.show() #shows room code entry and connect button


func _on_disconnect_pressed(): #closes network by running the function
	_close_network()

func _on_connect_butt_pressed():
	var txt= _host_edit.text
	
	if txt=="":
		OS.alert("Needs host to connect to")
		return
	multiplayerPeer.create_client(txt,PORT) #connects to the host at the given port and room code
	multiplayer.connect("connection_failed",Callable(self,"_close_network"))
	multiplayer.connect("connected_to_server",Callable(self,"_connected")) #connects rpc functions to check that it's connected

	multiplayer.set_multiplayer_peer(multiplayerPeer) #sets multiplayer per
	start_game() #goes to the join screen aka the player UI

###################################################################################################################



 



