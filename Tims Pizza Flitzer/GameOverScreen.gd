extends Node2D
# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	get_node("/root/Node2D/CanvasLayer/VBoxContainer/HBoxContainer/VBoxContainer/moneymade").text = "Money made: " + str(Globalvars.moneymade/100) + "€"
	get_node("/root/Node2D/CanvasLayer/VBoxContainer/HBoxContainer/VBoxContainer/pizzadelivered").text = "Pizzas delivered: " + str(Globalvars.pizzas)
	get_node("/root/Node2D/CanvasLayer/VBoxContainer/HBoxContainer/VBoxContainer/crashescaused").text = "Crashes caused: " + str(Globalvars.crashes)
	
func _on_Button_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://MainMenu.tscn")
