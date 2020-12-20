extends Node2D

# Declare member variables here.

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Area2D_body_entered(body):
	if body.name == "HanbokGirl":
		$SceneTransitionFade.transition_to("res://scenes/You.tscn")
		var file = File.new()
		file.open("user://end.txt", File.WRITE)
		file.store_string("Thank you for playing the demo of Comet Journal!")
		file.close()
