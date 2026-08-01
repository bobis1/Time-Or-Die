extends RigidBody2D

@export var player: Node2D
@export var chase_force: float = 800.0


func _ready() -> void:
	get_child(0).start()

func _physics_process(delta: float) -> void:
	if is_instance_valid(player):
		var direction = (player.global_position - global_position).normalized()
		apply_central_force(direction * chase_force)



func _on_timer_timeout() -> void:
	get_child(0).get_child(0).start()
	chase_force = 1600
	pass


func _on_timer_2_timeout() -> void:
	chase_force = 800
	get_child(0).start()
	pass
