extends Node2D

@export var PastDyn: PackedScene
@export var PresDyn: PackedScene
@export var FutDyn: PackedScene

var current_spawned_object: Node = null

func _ready() -> void:
	Globals.time_jumped.connect(_on_time_jumped)
	
	_spawn_era_object(Globals.currentTime)

func _on_time_jumped(new_era: String) -> void:
	_spawn_era_object(new_era)

func _spawn_era_object(era: String) -> void:
	if is_instance_valid(current_spawned_object):
		current_spawned_object.queue_free()
		
	var scene_to_spawn: PackedScene
	if era == "Present":
		scene_to_spawn = PresDyn
	elif era == "Past":
		scene_to_spawn = PastDyn
	else:
		scene_to_spawn = FutDyn
		
	if scene_to_spawn == null:
		return

	current_spawned_object = scene_to_spawn.instantiate()
	
	add_child(current_spawned_object)
	
	current_spawned_object.global_position = global_position
