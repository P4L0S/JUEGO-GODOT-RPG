extends Node2D

const ENEMIGO = preload("res://escenas/enemigo.tscn")
@onready var guerrero: Guerrero = $Guerrero
@onready var timer_spawn_enemigos: Timer = $TimerSpawnEnemigos


func _on_salir_del_juego_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/menu.tscn")

func _ready() -> void:
	timer_spawn_enemigos.timeout.connect(spawn_enemigos)
	timer_spawn_enemigos.wait_time=3
	timer_spawn_enemigos.start()




func spawn_enemigos():
	var enemigo=ENEMIGO.instantiate()
	var ramdom_angle:float=randf()*PI*2
	var spawn_distancia:float=randf_range(270,300)
	var spawn_offset:Vector2=Vector2(cos(random_angle), sin(random_angle))*spawn_distancia
	enemigo.position=spawn_offset+guerrero.position
	add_child(enemigo)
	
	
	
	
	
	
	
	
	
	
