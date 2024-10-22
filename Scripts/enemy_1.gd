extends Node2D

var player_speed = 0
var speed_x = 300
var move_direction = Vector2(1, -1)  # Movimiento X: derecha , Movimiento Y: arriba
var screen_width
var sprite_width

func _ready():
	screen_width = get_viewport().size.x
	var player = get_tree().get_nodes_in_group("PlayerGroup")[0]
	player_speed = player.speed


func _process(delta):
	print(global_position.x)
	var new_position = position + Vector2(move_direction.x * delta * speed_x, move_direction.y * delta * player_speed)
	position = new_position


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	if global_position.x < 0:
		speed_x *= -1
	else:
		speed_x *= -1
	pass
