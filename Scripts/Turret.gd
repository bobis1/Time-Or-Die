extends StaticBody2D

var Target: Node2D = null
var canShoot: bool = true

func _process(delta: float):
	if Target != null:
		var directionAngle = global_position.angle_to_point(Target.global_position) + PI
		$Top.rotation = lerp_angle($Top.rotation, directionAngle, 1.5)
		Shoot()

func Shoot():
	if canShoot:
		const Bullet = preload("res://Scenes/Bullet.tscn")
		var newBullet = Bullet.instantiate()
		$Top.add_child(newBullet)
		
		newBullet.global_transform = $Top.global_transform
		canShoot = false
		print("Shoot")
		$Timer.start()

func _on_detection_body_entered(body: Node2D):
	print(body)
	if body.name == "Player":
		Target = body

func _on_detection_body_exited(body: Node2D):
	if body.name == "Player":
		Target = null

func _on_timer_timeout():
	canShoot = true
