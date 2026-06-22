extends Node

signal score_changed(score: int)
signal lives_changed(lives: int)

const LEVELS = [
	"res://scenes/Level1.tscn",
	"res://scenes/Level2.tscn",
	"res://scenes/Level3.tscn",
]
const MAIN_MENU = "res://scenes/MainMenu.tscn"
const GAME_OVER = "res://scenes/GameOverScreen.tscn"
const WIN_SCREEN = "res://scenes/WinScreen.tscn"

var score: int = 0
var lives: int = 3
var current_level_index: int = 0

func new_game() -> void:
	score = 0
	lives = 3
	current_level_index = 0
	score_changed.emit(score)
	lives_changed.emit(lives)
	get_tree().call_deferred("change_scene_to_file", LEVELS[current_level_index])

func add_score(amount: int) -> void:
	score += amount
	score_changed.emit(score)

func lose_life() -> void:
	lives -= 1
	lives_changed.emit(lives)
	if lives <= 0:
		get_tree().call_deferred("change_scene_to_file", GAME_OVER)
	else:
		get_tree().call_deferred("reload_current_scene")

func complete_level() -> void:
	current_level_index += 1
	if current_level_index >= LEVELS.size():
		get_tree().call_deferred("change_scene_to_file", WIN_SCREEN)
	else:
		get_tree().call_deferred("change_scene_to_file", LEVELS[current_level_index])

func go_to_main_menu() -> void:
	get_tree().call_deferred("change_scene_to_file", MAIN_MENU)
