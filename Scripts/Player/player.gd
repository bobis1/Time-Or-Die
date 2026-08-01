extends CharacterBody2D


@export var SPEED = 500.0
@export var JUMP_VELOCITY = -700.0
@export var sprite: Sprite2D
var isLeft: bool
#@export var shadow: PackedScene
#var lastPoint: Vector2

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	#if Input.is_action_just_pressed("Rewind"):
	#	global_position = lastPoint
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction < 0:
		sprite.flip_h = true
	elif direction > 0:
		sprite.flip_h = false
		
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	move_and_slide()
	#if Input.is_action_just_pressed("AddPoint"):
	#	lastPoint = global_position
	#shadow.global_position = lastPoint
