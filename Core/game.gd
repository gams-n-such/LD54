extends Node

var caret_speed : float = 2.0
var max_spaces : int = 5
var line_width : int = 20
var allow_word_breaks : bool = true

var enable_space_highlights : bool = false

var game_text : String

@onready var menu_scene : PackedScene = load("res://Menu/main_menu.tscn")
@onready var gameplay_scene : PackedScene = load("res://Gameplay/gameplay.tscn")

@onready var line_scene : PackedScene = load("res://Gameplay/Text/game_line.tscn")
@onready var word_scene : PackedScene = load("res://Gameplay/Text/game_word.tscn")
@onready var space_scene : PackedScene = load("res://Gameplay/Text/game_space.tscn")

var current_spaces : int = 0

func _ready():
	process_mode = Node.PROCESS_MODE_DISABLED
	pass # Replace with function body.

# Level flow

func switch_to_menu_level():
	get_tree().change_scene_to_packed(menu_scene)

func switch_to_gameplay_level():
	get_tree().change_scene_to_packed(gameplay_scene)

func restart_level():
	get_tree().reload_current_scene()

# Settings

func apply_preset(preset : GameSettings):
	if preset == null:
		return
	
	caret_speed = preset.caret_speed
	max_spaces = preset.max_spaces
	line_width = preset.line_width
	allow_word_breaks = preset.allow_word_breaks
	
	return

func apply_level_data(level : GameLevel):
	apply_preset(level.preset)
	game_text = level.game_text
	
	return

# Rules

func can_place_space() -> bool:
	return current_spaces < max_spaces
