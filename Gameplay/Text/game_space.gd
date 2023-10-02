extends Control

@export var enabled : bool = false:
	get = get_enabled, set = set_enabled


func _ready():
	%DebugVisual.visible = Game.enable_space_highlights
	return


func _on_space_button_pressed():
	toggle_space()
	return

func toggle_space():
	enabled = !enabled
	return

func get_enabled() -> bool:
	return enabled

func set_enabled(new_enabled):
	if enabled == new_enabled:
		return
	if new_enabled and Game.can_place_space():
		Game.current_spaces += 1
		enabled = new_enabled
	elif !new_enabled:
		Game.current_spaces -= 1
		enabled = new_enabled
	else:
		return
	update_visual()
	play_sound()
	return

func update_visual():
	if enabled:
		custom_minimum_size = %SpaceText.size
	else:
		custom_minimum_size = Vector2.ZERO;
	return

func play_sound():
	if enabled:
		%HitAudio.play()
	else:
		%ReturnAudio.play()
	return
