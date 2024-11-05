extends Node2D

var direction
var speed
var timeAlive 

func _ready() -> void:
	timeAlive = 5.0
	
func _process(delta):
	moveBullet(delta)
	timeAlive -= delta
	if(timeAlive <= 0):
		queue_free()
	#if (!get_viewport_rect().has_point(position)):
	#	queue_free()
	#	print("Bullet deleted")



func moveBullet(dt):
	position += direction * speed * dt

func initializeBullet(p_direction, p_speed, p_pos):
	direction = p_direction
	look_at(direction);
	speed = p_speed
	global_position = p_pos
