extends Button

@onready var RollButt = $"."
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_roll_butt_pressed():
	var rng = RandomNumberGenerator.new()
	var dice = rng.randi_range(0, 6)
	RollButt.hide()
	
	if dice != 6:
		pass
	else:
		pass
		
		
	pass # Replace with function body.
	

