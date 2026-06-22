extends Control

func _ready() -> void:
	$VBox/ScoreLabel.text = "Skor: %d" % GameState.score

func _on_retry_pressed() -> void:
	Sfx.play(preload("res://assets/sfx/click.ogg"))
	GameState.new_game()

func _on_menu_pressed() -> void:
	Sfx.play(preload("res://assets/sfx/click.ogg"))
	GameState.go_to_main_menu()
