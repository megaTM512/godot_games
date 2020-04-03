extends Label

var minutes = 5
var seconds = 0
var timer

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# warning-ignore:unused_argument
func _process(delta):
	if seconds < 0:
		seconds = 59
		minutes -= 1
	if minutes < 0:
		get_node("/root/Game").end_game()
	
	if seconds < 10 or seconds == 0:
		text = (str(minutes) + ":0" + str(seconds))
	else:
		text = (str(minutes) + ":" + str(seconds))

func _enter_tree():
	timer = get_node("Timer")
	timer.start()




func _on_Timer_timeout():
	seconds -= 1
