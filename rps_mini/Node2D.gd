extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_3_button_down():
	get_tree().change_scene("res://show_result.tscn")
	pass # Replace with function body.


func _on_button_2_button_down():
	get_tree().change_scene("res://show_result.tscn")
	pass # Replace with function body.


func _on_button_button_down():
	get_tree().change_scene("res://show_result.tscn")
	pass # Replace with function body.


func _on_paper_pressed():
	get_tree().change_scene("res://show_result.tscn")
	pass # Replace with function body.
