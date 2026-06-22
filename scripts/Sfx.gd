extends Node

const POOL_SIZE = 8

var _players: Array[AudioStreamPlayer] = []
var _next: int = 0

func _ready() -> void:
	for i in POOL_SIZE:
		var p := AudioStreamPlayer.new()
		add_child(p)
		_players.append(p)

func play(stream: AudioStream, volume_db: float = 0.0) -> void:
	var p := _players[_next]
	_next = (_next + 1) % _players.size()
	p.stream = stream
	p.volume_db = volume_db
	p.play()
