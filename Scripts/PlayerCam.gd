extends Camera2D

@export var target: CharacterBody2D
@export var offset_y: float = 150.0

func _physics_process(_delta):
	if target:
		# Sigue la posición del jugador en el eje Y únicamente
		position.y = target.position.y - offset_y
