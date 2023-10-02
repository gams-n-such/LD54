extends Control


func _ready():
	pass # Replace with function body.

func set_result(win : bool):
	if win:
		%ResultText.text = "You win!"
	else:
		%ResultText.text = "You loose"

func _on_restart_button_pressed():
	Game.restart_level()

func _on_main_menu_button_pressed():
	Game.switch_to_menu_level()
