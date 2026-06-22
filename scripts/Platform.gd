extends StaticBody2D

@export var width_tiles: int = 3

const TILE_SCALE := 3.0
const TILE_SRC := 18
const TEXTURES: Array[Texture2D] = [
	preload("res://assets/sprites/ground_0.png"),
	preload("res://assets/sprites/ground_1.png"),
	preload("res://assets/sprites/ground_2.png"),
	preload("res://assets/sprites/ground_3.png"),
]

func _ready() -> void:
	var tile_size := TILE_SRC * TILE_SCALE
	for i in width_tiles:
		var sprite := Sprite2D.new()
		sprite.texture = TEXTURES[i % TEXTURES.size()]
		sprite.scale = Vector2(TILE_SCALE, TILE_SCALE)
		sprite.position = Vector2((i - (width_tiles - 1) / 2.0) * tile_size, 0)
		add_child(sprite)

	var shape := RectangleShape2D.new()
	shape.size = Vector2(tile_size * width_tiles, tile_size)
	$CollisionShape2D.shape = shape
