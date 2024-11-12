extends CharacterBody2D

@export var upVelMulti: float = 1
@export var speed: float = 600

@onready var health_system: Node = $HealthSystem
var useVelMulti: float = 0

func TakeDamage(damage):
	health_system.TakeDamage(damage)

func _ready() -> void:
	add_to_group("PlayerGroup")

func _process(_delta):
	if(!health_system.IsAlive()):
		Die()
	
func Movement(_delta):
	var directionX = Input.get_axis("left","right")
	
	if(Input.is_action_pressed("up")):
		useVelMulti = upVelMulti * 1.5
	elif (Input.is_action_pressed("down")):
		useVelMulti = upVelMulti * 0.6
	else:
		useVelMulti = upVelMulti
		
	#velocity = Vector2(directionX * speed, -useVelMulti * speed)
	position += Vector2(directionX * speed, -useVelMulti * speed) * _delta
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	Movement(_delta)

func GetSpeed() -> float:
	return speed

func desactivar_nodo_y_hijos(nodo: Node):
	# Desactivar el procesamiento del nodo actual
	nodo.set_process(false)
	nodo.set_physics_process(false)

func Die():
	for child in get_children():
		desactivar_nodo_y_hijos(child)
		
	set_process(false)
	set_physics_process(false)
	
	collision_layer = 0
	collision_mask = 0
	
	hide()
