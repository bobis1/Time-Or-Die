extends Node2D

@export var PastDyn: PackedScene
@export var PresDyn: PackedScene
@export var FutDyn: PackedScene

func _ready() -> void:
	if Globals.currentTime == "Present":
		var dynamicObj = create_instance(PresDyn)
		dynamicObj.global_position = global_position
	elif Globals.currentTime == "Past":
		var dynamicObj = create_instance(PastDyn)
		dynamicObj.global_position = global_position
	else:
		var dynamicObj = create_instance(FutDyn)
		dynamicObj.global_position = global_position
	pass


func _on_timeChanged():
	if Globals.currentTime == "Present":
		var dynamicObj = create_instance(PresDyn)
		dynamicObj.global_position = global_position
	elif Globals.currentTime == "Past":
		var dynamicObj = create_instance(PastDyn)
		dynamicObj.global_position = global_position
	else:
		var dynamicObj = create_instance(FutDyn)
		dynamicObj.global_position = global_position
	pass


func create_instance(add):
	var scene_instance = add.instantiate()
	return scene_instance