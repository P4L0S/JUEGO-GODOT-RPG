extends Control


func _on_atras_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/menu.tscn")


func _on_resolucion_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/resolución.tscn")
