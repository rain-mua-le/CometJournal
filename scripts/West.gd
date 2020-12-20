extends Node2D

# Declare member variables here. 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_StaticBody2D4_enterECSW():
	$SceneTransitionFade.transition_to("res://scenes/ECSWFloorOne.tscn")
