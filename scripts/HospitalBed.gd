extends StaticBody2D

# Declare member variables here.
var isIn = false
onready var hospitalGirl = get_node("/root/HospitalRoom/HospitalGirl")
signal dream

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if isIn and Input.is_action_pressed("ui_accept"):
		$AnimatedSprite.play("sleeping")
		hospitalGirl.queue_free()
		var i = 3
		while i > 0:
			$Label.text = "Dreaming in " + str(i) + "..."
			yield(get_tree().create_timer(1), "timeout")
			i -= 1
		emit_signal("dream")

func _on_Area2D_body_entered(body):
	if body.get_name() == "HospitalGirl":
		isIn = true

func _on_Area2D_body_exited(body):
	if body.get_name() == "HospitalGirl":
		isIn = false
