extends Node2D

func _on1__pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/Level-1.tscn")
	pass 


func _on2__pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/Level-2.tscn")
	pass


func _on3__pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/Level-3.tscn")
	pass


func _on_bounus_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/bounus.tscn")
	pass
func _on_silly_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/silly.tscn")
	pass
