extends Control

# Declare member variables here.

# Called when the node enters the scene tree for the first time.
func _ready():
	$AcceptDialog.popup()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_AcceptDialog_confirmed():
	var dir = Directory.new()
	dir.remove("user://end.txt")
	$Label.visible = true
	$Button.visible = true
	$Button.grab_focus()

func _on_Button_pressed():
	get_tree().quit()
