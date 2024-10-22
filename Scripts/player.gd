extends CharacterBody2D

@export var upVelMulti: float = 1
@export var speed: float = 600

@onready var health_system: Node = $HealthSystem

var useVelMulti: float = 0

func _ready():
	add_to_group("PlayerGroup")

func _process(_delta):
	#if(!health_system.IsAlive()):
	#	Die()
	pass
	
func Movement(_delta):
	var directionX = Input.get_axis("left","right")
	
	if(Input.is_action_pressed("up")):
		useVelMulti = upVelMulti * 1.5
	elif (Input.is_action_pressed("down")):
		useVelMulti = upVelMulti * 0.6
	else:
		useVelMulti = upVelMulti  # Valor predeterminado
	
	velocity = Vector2(directionX * speed, -useVelMulti * speed)

	# velocidad vertical siempre positiva para evitar movimiento hacia atras
	if velocity.y > 0:
		velocity.y = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	Movement(_delta)
	move_and_slide()

func Die():
	hide()

func get_player_direction() -> Vector2:
	var player_direction = (get_global_mouse_position() - position).normalized()
	return player_direction
