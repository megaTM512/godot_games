extends Sprite

var easyTable = [1,1,1,1,1,2,2,2,2,3,3,3,4,4]
var mediumTable = [2,2,2,3,3,3,3,4,4,4,5,5,6]
var hardTable = [2,3,3,4,4,4,4,4,4,5,5,5,5,6,6,6,7,7,8,9]
var currentTable

var available = false
var difficulty

var easyNumberOfToppings = [1,1,2,2,2,3]
var mediumNumberOfToppings = [2,2,3,3,3,4,4]
var hardNumberOfToppings = [2,3,3,4,4,4,5,5]
var currentNumberOfToppings

var wanted_toppings = []

var target_coordinates = [0,0]
var rngesus = RandomNumberGenerator.new()

onready var target_marker = get_node("/root/Game/target1")
const baseIncome = 60


func _ready():
	difficulty = Globalvars.difficulty
	randomize_this(2)
	rngesus.randomize()
	pass

func _enter_tree():
	randomize_this(2)
	rngesus.randomize()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if available:
		target_marker.position.x = target_coordinates[0] * 20 + 10
		target_marker.position.y = target_coordinates[1] * 20
	else: target_marker.position = Vector2(-100,-100)

func randomize_this(difficulty):
	#position:
	wanted_toppings= []
	for i in range(9):
		wanted_toppings.append(0)
	
	target_coordinates = get_node("/root/Game").eligible_positions[rngesus.randi_range(0,get_node("/root/Game").eligible_positions.size()-1)]
	
	if difficulty == 1:
		currentTable = easyTable
		currentNumberOfToppings = easyNumberOfToppings
	if difficulty == 2:
		currentTable = mediumTable
		currentNumberOfToppings = mediumNumberOfToppings
	if difficulty == 3:
		currentTable = hardTable
		currentNumberOfToppings = hardNumberOfToppings
		
	var NumberOfToppings = currentNumberOfToppings[rngesus.randi_range(0,currentNumberOfToppings.size()-1)]
	var i = 1
	var schonDrinne = Array()
	while(i != NumberOfToppings+1):
		get_node("numbers" + str(i)).frame = currentTable[rngesus.randi_range(0,currentTable.size()-1)]
		get_node("topping" + str(i)).show()
		var ok = false
		while(!ok):
			var c = rngesus.randi_range(0,8)			
			if !schonDrinne.has(c):
				get_node("topping" + str(i)).frame = c
				schonDrinne.append(c)
				ok = true
		wanted_toppings[get_node("topping" + str(i)).frame] = get_node("numbers" + str(i)).frame
		i+=1
		print(wanted_toppings)
	while(i != 6):
		get_node("numbers" + str(i)).frame = 0
		get_node("topping" + str(i)).hide()
		i+=1
		available = true
	
	
