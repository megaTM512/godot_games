extends Camera2D


# Declare member variables here. Examples:
# var a = 2
var c = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# warning-ignore:unused_argument
func _process(delta):
	c += 0.001
	position.y = 200 + sin(c)*100
	position.x = 280 + sin(1.4*c+43)*100

func _enter_tree():
	position = Vector2(280,200)
