extends Control

func _on_start_pressed() -> void:
	Sfx.play(preload("res://assets/sfx/click.ogg"))
	GameState.new_game()

func _on_quit_pressed() -> void:
	Sfx.play(preload("res://assets/sfx/click.ogg"))
	get_tree().quit()
