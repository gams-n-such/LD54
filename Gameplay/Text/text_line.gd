extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_game_space_gui_input(event):
	var mouse_event = event as InputEventMouseButton
	if mouse_event != null:
		if mouse_event.pressed:
			print(event.get_class())
			$HBoxContainer/GameSpace.visible = !$HBoxContainer/GameSpace.visible
	return
