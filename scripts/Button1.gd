extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _pressed():
	print("Press")
	var dice_1 = rng.randi_range(0, 6)
	var dice_2 = rng.randi_range(0, 6)
	print(rng.randi_range(0, 6), rng.randi_range(0, 6))
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
