extends Area2D

@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@export var tagIgnore: StringName = "none"

var direction
var speed
var timeAlive
var damage

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

func initializeBullet(p_direction, p_speed, p_pos, damageIn):
	direction = p_direction
	look_at(direction);
	speed = p_speed
	global_position = p_pos
	damage = damageIn

func _on_body_entered(body):		
	if (body.is_in_group("WithHealth")) :
		body.TakeDamage(damage)
		queue_free();
	#die and animate
	
func SetLayerColision(mask):
	collision_mask = 1 << mask
