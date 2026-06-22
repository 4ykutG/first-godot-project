extends CharacterBody2D

@export var speed: float = 60.0
@export var patrol_distance: float = 80.0

const GRAVITY = 1100.0
const FRAME_TIME = 0.2
const FRAMES: Array[Texture2D] = [
	preload("res://assets/sprites/enemy_0.png"),
	preload("res://assets/sprites/enemy_1.png"),
	preload("res://assets/sprites/enemy_2.png"),
]

var _start_x: float
var _direction: int = 1
var _frame_index: int = 0
var _frame_timer: float = 0.0

func _ready() -> void:
	_start_x = position.x

func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY * delta
	velocity.x = speed * _direction
	move_and_slide()

	if abs(position.x - _start_x) >= patrol_distance:
		_direction *= -1
	$Sprite2D.flip_h = _direction < 0

	_frame_timer += delta
	if _frame_timer >= FRAME_TIME:
		_frame_timer = 0.0
		_frame_index = (_frame_index + 1) % FRAMES.size()
		$Sprite2D.texture = FRAMES[_frame_index]

func _on_hit_area_body_entered(body: Node2D) -> void:
	if body.has_method("hurt"):
		body.hurt()
