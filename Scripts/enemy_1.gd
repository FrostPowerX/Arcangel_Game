extends Node2D

var player_speed = 0
var speed_x = 300
var move_direction = Vector2(1, -1)  # Movimiento X: derecha , Movimiento Y: arriba
var screen_width

func _ready():
	screen_width = get_viewport().size.x
	var player = get_tree().get_nodes_in_group("PlayerGroup")[0]
	player_speed = player.speed

func _process(delta):
	var new_position = position + Vector2(move_direction.x * delta * speed_x, move_direction.y * delta * player_speed)
	
	# Cambiar dirección al alcanzar los bordes de la pantalla
	if new_position.x < 0 or new_position.x > screen_width:  
		move_direction.x *= -1
	
	# DEBUG
	print("Debug from enemy_1.gd")
	print(screen_width)
	print(position.x)
	# DEBUG
	
	position = new_position
