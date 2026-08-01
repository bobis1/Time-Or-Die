extends Area2D

var SPEED = 100
var distance: float = 0.0

func _process(delta: float):
	position.x += SPEED * delta
	distance += SPEED * delta
	
	if distance >= 670:
		queue_free() 
