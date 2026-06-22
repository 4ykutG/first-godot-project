extends CanvasLayer

func _ready() -> void:
	GameState.score_changed.connect(_on_score_changed)
	GameState.lives_changed.connect(_on_lives_changed)
	_on_score_changed(GameState.score)
	_on_lives_changed(GameState.lives)

func _on_score_changed(score: int) -> void:
	$Margin/HBox/ScoreLabel.text = "Skor: %d" % score

func _on_lives_changed(lives: int) -> void:
	$Margin/HBox/LivesLabel.text = "Can: %d" % lives
