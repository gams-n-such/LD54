extends Control

@export var text : String = ""

func _ready():
	if text.length() > 0:
		fill_from_text(text)
	else:
		clear_text()
	return

func _process(delta):
	pass


func fill_from_text(new_text : String):
	assert(Game.line_width > 0)
	text = new_text
	var words = new_text.split(" ", false)
	var curr_line_text = ""
	var spaceless_line = ""
	for word in words:
		if spaceless_line.length() + word.length() >= Game.line_width:
			if Game.allow_word_breaks:
				var curr_word = word
				while spaceless_line.length() + curr_word.length() >= Game.line_width:
					var chars_left = Game.line_width - spaceless_line.length()
					curr_line_text += " " + curr_word.left(chars_left)
					add_line(curr_line_text)
					curr_word = curr_word.right(-chars_left)
					curr_line_text = ""
					spaceless_line = ""
				curr_line_text = curr_word
				spaceless_line = curr_word
			else:
				curr_line_text += " " + word
				add_line(curr_line_text)
				curr_line_text = ""
				spaceless_line = ""
		else:
			curr_line_text += " " + word
			spaceless_line += word
	return

func add_line(line_text : String):
	var line = Game.line_scene.instantiate()
	line.fill_from_string(line_text)
	%LinesBox.add_child(line)
	return

func clear_text():
	for node in %LinesBox.get_children():
		%LinesBox.remove_child(node)
		node.queue_free()
	return
