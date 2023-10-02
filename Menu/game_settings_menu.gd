extends Control


func _ready():
	%SpeedSpinBox.set_value_no_signal(Game.caret_starting_speed)
	%MaxSpeedSpinBox.set_value_no_signal(Game.caret_max_speed)
	%AccelerationSpinBox.set_value_no_signal(Game.caret_acceleration)
	%MaxSpacesSpinBox.set_value_no_signal(Game.max_spaces)
	%LineWidthSpinBox.set_value_no_signal(Game.line_width)
	%AllowBreaksCheckBox.set_pressed_no_signal(Game.allow_word_breaks)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_speed_value_changed(value):
	Game.caret_starting_speed = value

func _on_max_speed_value_changed(value):
	Game.caret_max_speed = value

func _on_acceleration_value_changed(value):
	Game.caret_acceleration = value

func _on_max_spaces_value_changed(value):
	Game.max_spaces = value

func _on_line_width_value_changed(value):
	Game.line_width = value

func _on_allow_breaks_toggled(button_pressed):
	Game.allow_word_breaks = button_pressed

