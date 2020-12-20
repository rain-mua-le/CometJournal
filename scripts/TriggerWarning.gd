extends Control

# Declare member variables here.

# Called when the node enters the scene tree for the first time.
func _ready():
	$Yes.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Yes_pressed():
	$SceneTransitionFade.transition_to("res://scenes/HospitalRoom.tscn")

func _on_No_pressed():
	get_tree().quit()
