extends ColorRect

# Declare member variables here.
export(String, FILE, ".tscn") var next_scene_path;

# Called when the node enters the scene tree for the first time.
func _ready():
	$Fade.play_backwards("Fade")
	
func transition_to(_next_scene := next_scene_path):
	$Fade.play("Fade")
	yield($Fade, "animation_finished")
	get_tree().change_scene(_next_scene)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
