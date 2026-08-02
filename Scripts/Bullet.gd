extends Area2D

var SPEED = -670
var distance: float = 0.0

func _process(delta: float):
	position.x += SPEED * delta
	distance += SPEED * delta
	
	if distance >= 200:
		queue_free() 


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Globals.lives -= 1
		queue_free()
	pass 
