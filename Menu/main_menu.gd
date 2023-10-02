extends Control

@export var default_level : GameLevel

func _enter_tree():
	Game.apply_level_data(default_level)
	return

func _ready():
	%GameTextBox.text = Game.game_text
	return

func _process(_delta):
	pass


func _on_play_button_pressed():
	Game.switch_to_gameplay_level()


func _on_game_text_changed():
	Game.game_text = %GameTextBox.text
	return
