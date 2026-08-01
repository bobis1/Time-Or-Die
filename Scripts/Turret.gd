extends StaticBody2D

var Target: Node2D = null

func _process(delta: float):
	if Target != null:
		var directionAngle = global_position.angle_to_point(Target.global_position) + PI
		$Top.rotation = lerp_angle(rotation, directionAngle, 1)
		Shoot()
		$Timer.start()

func Shoot():
	const Bullet = preload("res://Scenes/Bullet.tscn")
	var newBullet = Bullet.instantiate()
	$Top.add_child(newBullet)
	
	newBullet.global_transform = $Top.global_transform

func _on_detection_body_entered(body: Node2D):
	Target = body

func _on_detection_body_exited(body: Node2D):
	Target = null

func _on_timer_timeout():
	pass
