extends Control

# Declare member variables here. Examples:
const section_time := 2.0
const line_time := 0.3
const base_speed := 100
const title_color := Color.blueviolet
var scroll_speed := base_speed
onready var line := $Label
var started := false
var finished := false
var section
var section_next := true
var section_timer := 0.0
var line_timer := 0.0
var curr_line := 0
var lines := []
var credits = [["Game designer", " ", "TheWeatherGirl45"], ["Pixel artist", " ", "TheWeatherGirl45"],
["Animator", " ", "TheWeathergirl45"], ["Programmer", " ", "TheWeatherGirl45"], ["Narrative", " ", "TheWeatherGirl45"],
["Music", " ", "Bwarch", " ", "https://bwarch.bandcamp.com"], 
["Game created with the Godot engine", " ", "https://godotengine.org/license"], 
["Pixel art created with Piskel", " ", "https://www.piskelapp.com"],
["Special thanks", " ", "My parents", " ", "My siblings", " ", "My therapist"], 
["And to you", " ", "Thanks for playing the demo", " ", "of Comet Journal!"]]

# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var scroll_speed = base_speed * delta
	if section_next:
		section_timer += delta
		if section_timer >= section_time:
			section_timer -= section_time
			if credits.size() > 0:
				started = true
				section = credits.pop_front()
				curr_line = 0
				add_line()
	else:
		line_timer += delta
		if line_timer >= line_time:
			line_timer -= line_time
			add_line()
	if lines.size() > 0:
		for l in lines:
			l.rect_position.y -= scroll_speed
			if l.rect_position.y < -l.get_line_height():
				lines.erase(l)
				l.queue_free()
	elif started:
		finish()

func finish():
	if not finished:
		finished = true
		get_tree().change_scene("res://scenes/Poem.tscn")

func add_line():
	var new_line = line.duplicate()
	new_line.text = section.pop_front()
	lines.append(new_line)
	if curr_line == 0:
		new_line.add_color_override("font_color", title_color)
	self.add_child(new_line)
	if section.size() > 0:
		curr_line += 1
		section_next = false
	else:
		section_next = true

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel"):
		finish()
