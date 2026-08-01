extends AudioStreamPlayer

@export var musics: Array[AudioStream]


func _ready() -> void:
	var randomIndex = randi() % musics.size()
	play_track(randomIndex)
	pass

func play_track(track_index: int) -> void:
	if musics.is_empty():
		push_warning("No music files in the array!")
		return

	if track_index >= 0 and track_index < musics.size():
		stream = musics[track_index]
		play()
	else:
		push_warning("Track index out of bounds!")
