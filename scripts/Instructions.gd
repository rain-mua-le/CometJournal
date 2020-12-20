extends TextureRect

# Declare member variables here.
var instructionsList = []
var i = 0
var change = false

# Called when the node enters the scene tree for the first time.
func _ready():
	instructionsList.append("Use arrow keys to move.\nPress enter to interact with objects.\nPress escape key for menu.")
	instructionsList.append("1. Go to bed\n2. Enter the dream world\n3.Wake up (menu option)")
	instructionsList.append("In dream world, explore and experience\nevents.")
	instructionsList.append("To save the game, write in\njournal when awake (menu option)")
	$Label.text = instructionsList[i]
	$GoBack.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if i == 0:
		$Previous.disabled = true
	elif i == 3:
		$Next.disabled = true
	else:
		$Previous.disabled = false
		$Next.disabled = false
	if change:
		change = false
		$Label.text = instructionsList[i]

func _on_Previous_pressed():
	i -= 1
	if not change:
		change = true

func _on_Next_pressed():
	i += 1
	if not change:
		change = true

func _on_GoBack_pressed():
	$SceneTransitionFade.transition_to("res://scenes/MainMenu.tscn")
