extends Node2D

# Declare member variables here.
var isIn = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isIn and Input.is_action_pressed("ui_accept"):
		$AudioStreamPlayer2.play()
		$ECSWElevator.play("opening")
		$SceneTransitionFade.transition_to("res://scenes/ECSWHall.tscn")

func _on_Area2D_body_entered(body):
	if body.name == "HanbokGirl":
		isIn = true

func _on_Area2D_body_exited(body):
	if body.name == "HanbokGirl":
		isIn = false
