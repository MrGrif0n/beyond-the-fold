extends Node2D


func _on_lvl_select_pressed() -> void:
	get_tree().change_scene_to_file("res://level_selection.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://level1/node_3d.tscn")
