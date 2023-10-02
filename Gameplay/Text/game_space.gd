extends Control

@export var enabled : bool = false:
	get:
		return enabled
	set(value):
		enabled = value
		if enabled:
			custom_minimum_size = %SpaceText.size
		else:
			custom_minimum_size = Vector2.ZERO;


func _ready():
	pass # Replace with function body.


func _on_space_button_pressed():
	toggle_space()
	return

func toggle_space():
	enabled = !enabled
	return
