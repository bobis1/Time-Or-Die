extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -400.0

var Target: Node = null
var Attack: bool = false

@onready var WallDetectionRight: RayCast2D = $Raycast/WallDetectionRight
@onready var WallDetectionLeft: RayCast2D = $Raycast/WallDetectionLeft
@onready var FallDetectionLeft: RayCast2D = $Raycast/FallDetectionLeft
@onready var FallDetectionRight: RayCast2D = $Raycast/FallDetectionRight

func _physics_process(delta: float):
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if Attack:
		pass
	
	if Target != null and FallDetectionLeft.is_colliding() and FallDetectionRight.is_colliding():
		var direction = (Target.global_position - global_position).normalized()
		velocity.x = direction.x * SPEED
	else:
		velocity.x = move_toward(SPEED, 0, delta)
	
	if WallDetectionLeft.is_colliding() or WallDetectionRight.is_colliding() and is_on_floor():
		velocity.y = JUMP_VELOCITY

	move_and_slide()

func _on_hitbox_body_entered(body: Node2D):
	if body.is_in_group("Player"):
		Attack = true

func _on_hitbox_body_exited(body: Node2D):
	if body.is_in_group("Player"):
		Attack = false

func _on_sight_body_entered(body: Node2D):
	if body.is_in_group("Player"):
		Target = body

func _on_sight_body_exited(body: Node2D):
	if body.is_in_group("Player"):
		Target = null
