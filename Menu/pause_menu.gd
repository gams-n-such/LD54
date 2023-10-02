extends Control

signal resume_requested

func _ready():
	pass # Replace with function body.


func _on_resume_button_pressed():
	resume_requested.emit()

func _on_restart_button_pressed():
	Game.restart_level()

func _on_main_menu_button_pressed():
	Game.switch_to_menu_level()
