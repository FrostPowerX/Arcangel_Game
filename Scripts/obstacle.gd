extends Area2D
@export var damage: float = 1.0
@export var collider:CollisionShape2D 
#@onready var collider = $CollisionShape2D

func _on_body_entered(body):
	body.TakeDamage(damage)
	#die and animate
