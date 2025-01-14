class_name Guerrero extends CharacterBody2D

@onready var sprite_animation: AnimatedSprite2D = $AnimatedSprite2D
@onready var guerrero:Guerrero=$guerrero


var move_speed:=100
var attack_damage:=50
var is_attack:=false


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index==MOUSE_BUTTON_LEFT:
			if event.pressed==true:
				attack()
				if event.button_index!=MOUSE_BUTTON_LEFT:
					run()


func _physics_process(_delta: float) -> void:
	if !is_attack:
		var move_direction:=Input.get_vector("ui_left","ui_right","ui_up","ui_down")
		
		if move_direction:
			velocity=move_direction*move_speed
		sprite_animation.play("correr")
		if move_direction.x!=0:
			sprite_animation.flip_h=move_direction.x<0
		
		
		
		
		
		
		
		
		else:
			velocity=velocity.move_toward(Vector2.ZERO,move_speed)
			sprite_animation.play("base")
		
		move_and_slide()


func run():
	sprite_animation.play("correr")

func attack():
	sprite_animation.play("atacar")
	is_attack=true

func _on_animated_sprite_2d_animation_finished()->void:
	if sprite_animation.animation=="atacar":
		is_attack=false
