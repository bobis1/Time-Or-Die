extends RigidBody2D

var player: Node2D
@export var chase_force: float = 800.0

func _ready() -> void:
	player = get_tree().get_first_node_in_group("Player")
	get_child(2).start()

func _physics_process(_delta: float) -> void:
	if is_instance_valid(player):
		var direction = (player.global_position - global_position).normalized()
		apply_central_force(direction * chase_force)

func _on_timer_timeout() -> void:
	queue_free()
	pass


func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		Globals.lives -= 1
	pass 
