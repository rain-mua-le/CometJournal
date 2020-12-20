extends StaticBody2D

# Declare member variables here.
var isIn = false
onready var hospitalGirl = get_node("/root/West/HanbokGirl")
signal enterECSW

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if isIn and Input.is_action_pressed("ui_accept"):
		emit_signal("enterECSW")

func _on_Area2D_body_entered(body):
	if body.get_name() == "HanbokGirl":
		isIn = true

func _on_Area2D_body_exited(body):
	if body.get_name() == "HanbokGirl":
		isIn = false
