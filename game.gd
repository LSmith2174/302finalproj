######################################################################################################################################################################################
#The game node is the main controller of all of the multiplayer functions. It moves the player and shows the action sequences such as roll and doubt
######################################################################################################################################################################################

extends Control

###################################################################################################################

var _players = [] #player array
var _turn = -1 #turn num

#parts of the node
@onready var _list = $ItemList #used for debugging turn order
@onready var _board = $Main #the actual board/host scene
@onready var _player_screen = $join #the player's UI scene
@onready var _player_nodes = $"Main/board/Player-list" #the player id's

###################################################################################################################


@rpc("any_peer", "call_local") 
func set_player_name(_name): #set's the name given in the field, will later be used to list the players joined
	var sender = multiplayer.get_remote_sender_id()
	rpc("update_player_name", sender, _name)


@rpc("any_peer", "call_local") func update_player_name(player, _name): #to update the player name in the list used for debugging
	var pos = _players.find(player)
	if pos != -1:
		_list.set_item_text(pos, _name)

###################################################################################################################


@rpc ("any_peer","call_local")
func request_action(action): #sees if it's the player's turn to do an action, then does action and goes to next turn
	var sender = multiplayer.get_remote_sender_id()
	if _players[_turn] != multiplayer.get_remote_sender_id():
		rpc("_log", "Someone is trying to cheat! %s" % str(sender))
		return
	do_action(action)
	next_turn()


@rpc("any_peer", "call_local") 
func do_action(action): #moves player the rolled/lied amount
	for child in _player_nodes.get_children():
		if child.name.to_int() == _players[_turn]:
			child.move_to_index(action)


@rpc("any_peer", "call_local") func set_turn(turn): #sets the turn up
	_turn = turn
	if turn >= _players.size(): #if it's at the end of the turns list
		return
	#for i in range(0, _players.size()):
	if _players[turn] == multiplayer.get_unique_id(): #if the player who's turn it is, roll otherwise doubt/pass
		_player_screen.roll_turn(_players[turn])
	else:
		_player_screen._not_turn(_players[turn])
		

###################################################################################################################

@rpc("any_peer", "call_local") func del_player(id): #delete the player from the list and player array
	var pos = _players.find(id)
	if pos == -1:
		return
	_players.remove_at(pos) #finds id and removes it
	_list.remove_item(pos)
	if _turn > pos: #sets amount of turns down 1
		_turn -= 1
	if multiplayer.is_server(): #sets up the turn again
		rpc("set_turn", _turn)


@rpc("any_peer", "call_local") func add_player(id, _name=""): #adds player to the lists and sets up multiplayer
	if _name == "":
		_list.add_item("... connecting ...", null, false) #connecting with no name given
	else:
		_list.add_item(_name, null, false) #when get's name adds it to the list
	# this will show the host screen or the player screen based on wheather it is the host or not that you are adding as a player
	if id == 1: #id 1 is the host, and sets the id and starts board
		_board.set_multiplayer_authority(id)
		_board.start()
	else: #otherwise it's a player and adds id to player array and sets up the multiplayer athourity and the player token on th board and changes to the player UI screen
		_players.append(id)
		_player_screen.set_multiplayer_authority(id)
		_board.add_player(str(id), _players.size())
		_player_screen.start()

###################################################################################################################

func next_turn():
	#increment the turn counter and call the function to sync it with the other players
	_turn += 1
	if _turn >= _players.size():
		_turn = 0
	rpc("set_turn", _turn)


func start():
	set_turn(0) #starts the turn order 


func stop(): #stops the game and clears everything
	_players.clear()
	_list.clear()
	_turn = 0

###################################################################################################################

func get_player_name(pos): #get's the player's name from the list
	if pos < _list.get_item_count():
		return _list.get_item_text(pos)
	else:
		return "Error!"


func on_peer_add(id): #if it's not the host adds the player id and sets up the player just like a class kind of in c++
	if not multiplayer.is_server():
		return
	for i in range(0, _players.size()):
		rpc_id(id, "add_player", _players[i], get_player_name(i))
	rpc("add_player", id)
	rpc_id(id, "set_turn", _turn)


func on_peer_del(id): #deletes the player 
	if not multiplayer.is_server():
		return
	rpc("del_player", id)

###################################################################################################################
#called when you send the roll signal
func _on_join_roll(dice): #moves the player and goes to next turn 
	if multiplayer.is_server():
		do_action(dice)
		next_turn()
	else:
		rpc_id(1, "request_action", dice)

###################################################################################################################
