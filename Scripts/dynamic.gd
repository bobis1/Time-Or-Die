extends Node2D

@export var PastDyn: PackedScene
@export var PresDyn: PackedScene
@export var FutDyn: PackedScene



func _process(delta: float) -> void:
	var CurrentDyn
	if Globals.currentTime == "Present":
		CurrentDyn = PresDyn.instantiate()
	elif Globals.currentTime == "Past":
		CurrentDyn = PastDyn.instantiate()
	else:
		CurrentDyn = FutDyn.instantiate()
	CurrentDyn.global_position = global_position
pass
