extends Node2D

var Player_child

func _enter_tree():
	set_multiplayer_authority(str(name).to_int())

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child.has_method("move_to_index"):
			Player_child = child
		if child.name == 'CanvasLayer' && not is_multiplayer_authority():
			child.visible = 0
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_one_button_down():
	Player_child.move_to_index(1)
	pass # Replace with function body.


func _on_two_button_down():
	Player_child.move_to_index(2)
	pass # Replace with function body.


func _on_three_button_down():
	Player_child.move_to_index(3)
	pass # Replace with function body.


func _on_four_button_down():
	Player_child.move_to_index(4)
	pass # Replace with function body.


func _on_five_button_down():
	Player_child.move_to_index(5)
	pass # Replace with function body.
