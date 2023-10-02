extends Node

var caret_speed : float = 2.0
var max_spaces : int = 5
var line_width : int = 20
var allow_word_breaks : bool = true

var game_text : String

func _ready():
	process_mode = Node.PROCESS_MODE_DISABLED
	pass # Replace with function body.


func apply_preset(preset : GamePreset):
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
