extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return
	GameState.add_score(10)
	Sfx.play(preload("res://assets/sfx/coin.ogg"))
	hide()
	set_deferred("monitoring", false)
	queue_free()
