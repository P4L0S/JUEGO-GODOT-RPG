class_name Enemigo extends CharacterBody2D

var move_speed = 50
var attack_damage = 10
var is_attack = false

@onready var guerrero: Node2D = $"../Guerrero"

@onready var sprite_animation: AnimatedSprite2D = $AnimatedSprite2D


func _physics_process(_delta: float) -> void:
	if is_attack and guerrero:
		sprite_animation.play("run")
		
	if guerrero:
		var move_direction = (guerrero.position - position).normalized()
		if move_direction:
			velocity = move_direction * move_speed
			if move_direction.x!=0:
				sprite_animation.flip_h=move_direction.x<0
			
			
			
			
			
		move_and_slide()
	else:
		print("Guerrero no está asignado correctamente o no tiene posición.")
		
