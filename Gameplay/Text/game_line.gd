extends Control

signal line_ended(excess_symbols)

@export var text : String = ""

var symbols_covered : float = 0
var next_space_idx : int = 0

func _init():
	process_mode = Node.PROCESS_MODE_DISABLED
	return

func _ready():
	if text.length() > 0:
		fill_from_string(text)
	else:
		clear_line()
	return

func _process(delta):
	var old_symbols = symbols_covered
	symbols_covered += delta * Game.caret_speed
	
	if symbols_covered >= text.length():
		stop_line()
		return
	
	var curr_symbol_idx = floori(symbols_covered)
	var prev_symbol_idx = floori(old_symbols)
	if prev_symbol_idx == curr_symbol_idx:
		return
	
	if text[curr_symbol_idx]:
		pass
	
	return

func start_line(initial_symbols : float = 0.0):
	if initial_symbols > 0:
		symbols_covered = initial_symbols
	process_mode = Node.PROCESS_MODE_PAUSABLE
	return

func stop_line():
	process_mode = Node.PROCESS_MODE_DISABLED
	return

func fill_from_string(line_text : String):
	clear_line()
	text = line_text
	var words = text.split(" ", false)
	for word in words:
		if %WordsBox.get_child_count() > 0:
			add_space()
		add_word(word)
	return

func fill_from_words(_words):
	clear_line()
	pass
	return

func clear_line():
	for node in %WordsBox.get_children():
		%WordsBox.remove_child(node)
		node.queue_free()
	return

func add_word(word : String):
	var word_label = Game.word_scene.instantiate()
	word_label.text = word
	%WordsBox.add_child(word_label)
	return

func add_space():
	var space = Game.space_scene.instantiate()
	%WordsBox.add_child(space)
	return
