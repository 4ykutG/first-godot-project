extends Area2D

var _triggered: bool = false

func _on_body_entered(body: Node2D) -> void:
	if _triggered or not body.is_in_group("player"):
		return
	_triggered = true
	Sfx.play(preload("res://assets/sfx/win.ogg"))
	GameState.complete_level()
