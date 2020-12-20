extends Sprite

# Declare member variables here.
var shader_material;
var shader_strength_vector = Vector2(1, 1);
var shader_strength = 1;
const LOWEST_SHADER_STRENGTH = 1;
const HIGHEST_SHADER_STRENGTH = 100;
var shader_speed = 100;
var shader_do_transition = false;
var shader_become_stronger = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	shader_material = $PixelatedTransition.material;
	$PixelatedTransition.visible = false;
	shader_strength = HIGHEST_SHADER_STRENGTH;
	shader_strength_vector.x = shader_strength; shader_strength_vector.y = shader_strength;
	shader_material.set_shader_param("size", shader_strength_vector);
	if MainMenuMusic:
		MainMenuMusic.free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var file = File.new()
	if file.file_exists("user://end.txt"):
		$Label.visible = true
		$HospitalGirl.disabled = true
		$HospitalGirl/AnimatedSprite.play("waving")
		yield($HospitalGirl/AnimatedSprite, "animation_finished")
		$SceneTransitionFade.transition_to("res://scenes/Credits.tscn")
	if (shader_do_transition == true):
		if (shader_become_stronger == true):
			shader_strength += delta * shader_speed;
			if (shader_strength >= HIGHEST_SHADER_STRENGTH):
				$PixelatedTransition.visible = false;
				shader_strength = HIGHEST_SHADER_STRENGTH;
				shader_do_transition = false;
				shader_become_stronger = false;
		else:
			shader_strength -= delta * shader_speed;
			if (shader_strength <= LOWEST_SHADER_STRENGTH):
				get_tree().change_scene("res://scenes/Nexus.tscn")
				shader_strength = LOWEST_SHADER_STRENGTH;
				shader_do_transition = false;
				shader_become_stronger = true;
		shader_strength_vector.x = shader_strength; shader_strength_vector.y = shader_strength;
		shader_material.set_shader_param("size", shader_strength_vector);

func _on_HospitalBed_dream():
	if (shader_do_transition == false):
		shader_do_transition = true
		$PixelatedTransition.visible = true
