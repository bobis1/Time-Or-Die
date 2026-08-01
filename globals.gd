extends Node

signal time_jumped(new_era: String)
#signal lives_changed(new_lives: int)

var currentTime: String = "Present":
    set(value):
        currentTime = value
        time_jumped.emit(currentTime)

var lives: int = 4