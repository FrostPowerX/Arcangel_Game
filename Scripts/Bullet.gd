extends Node2D

var direction
var speed



func _process(delta):
	moveBullet(delta)
	#if (!get_viewport_rect().has_point(position)):
	#	queue_free()
	#	print("Bullet deleted")



func moveBullet(dt):
	position += direction * speed * dt

func initializeBullet(p_direction, p_speed, p_pos, b_speed):
	direction = p_direction
	speed = p_speed + b_speed
	global_position = p_pos
