extends Control


func _ready():
	%SpeedSpinBox.set_value_no_signal(GameSettings.caret_speed)
	%MaxSpacesSpinBox.set_value_no_signal(GameSettings.max_spaces)
	%LineWidthSpinBox.set_value_no_signal(GameSettings.line_width)
	%AllowBreaksCheckBox.set_pressed_no_signal(GameSettings.allow_word_breaks)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_speed_value_changed(value):
	GameSettings.caret_speed = value

func _on_max_spaces_value_changed(value):
	GameSettings.max_spaces = value

func _on_line_width_value_changed(value):
	GameSettings.line_width = value

func _on_allow_breaks_toggled(button_pressed):
	GameSettings.allow_word_breaks = button_pressed
