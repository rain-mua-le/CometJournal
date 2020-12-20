extends MarginContainer

# Declare member variables here. 

# Called when the node enters the scene tree for the first time.
func _ready():
	$HBoxContainer/VBoxContainer/StartResume.grab_focus();

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_StartResume_pressed():
	$SceneTransitionFade.transition_to("res://scenes/TriggerWarning.tscn")

func _on_Instructions_pressed():
	$SceneTransitionFade.transition_to("res://scenes/Instructions.tscn")

func _on_Quit_pressed():
	get_tree().quit()
