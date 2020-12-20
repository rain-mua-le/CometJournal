extends Node2D

# Declare member variables here.

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_Area2D_body_entered(body):
	if (body.name == "HanbokGirl"):
		$SceneTransitionFade.transition_to("res://scenes/West.tscn")
