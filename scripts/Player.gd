extends CharacterBody2D

const SPEED = 220.0
const JUMP_VELOCITY = -920.0
const GRAVITY = 1100.0
const FALL_DEATH_Y = 700.0

var is_dead: bool = false

func _physics_process(delta: float) -> void:
	if is_dead:
		return

	velocity.y += GRAVITY * delta

	if is_on_floor() and Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY
		Sfx.play(preload("res://assets/sfx/jump.ogg"))

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		$Sprite2D.flip_h = direction < 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	if global_position.y > FALL_DEATH_Y:
		hurt()

func hurt() -> void:
	if is_dead:
		return
	is_dead = true
	velocity = Vector2.ZERO
	set_physics_process(false)
	$CollisionShape2D.set_deferred("disabled", true)
	Sfx.play(preload("res://assets/sfx/hurt.ogg"))
	GameState.lose_life()
