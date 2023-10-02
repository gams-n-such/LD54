extends Control

@export var enabled : bool = false:
	get = get_enabled, set = set_enabled


func _ready():
	%DebugVisual.visible = Game.enable_space_highlights
	return

func _exit_tree():
	try_disable()
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
	
	var success = false
	if new_enabled:
		success = try_enable()
	else:
		success = try_disable()
	
	if success:
		enabled = new_enabled
		update_visual()
		play_sound()
	
	return

func try_enable() -> bool:
	if enabled:
		return false
	if Game.can_place_space():
		Game.current_spaces += 1
		return true
	else:
		return false

func try_disable() -> bool:
	if !enabled:
		return false
	Game.current_spaces -= 1
	return true

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
