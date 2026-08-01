extends Label

@export var Phrases: Array[String]

func _ready() -> void:
	text = Phrases[randi_range(0, Phrases.size()-1)]
	$Timer.start()
	pass



func _on_timer_timeout() -> void:
	$Timer.start()
	text = Phrases[randi_range(0, Phrases.size()-1)]
	pass
