extends CharacterBody2D
class_name Enemy
@export var speed: float = 300
@export var target: CharacterBody2D 
@onready var player_cam: Camera2D = $"../PlayerCam"

@onready var turret: Node2D = $Turret
@onready var health_system: Node = $HealthSystem

func _process(delta: float) -> void:
	if(!health_system.IsAlive()):
		Die()

func _physics_process(delta: float) -> void:
	position = position.move_toward(target.position + Vector2(0,-500), speed * delta)
	move_and_slide()

func GetTarget():
	return target
	
func TakeDamage(damage):
	health_system.TakeDamage(damage)
	
func SetTarget(newTarget: CharacterBody2D):
	target = newTarget
	
func desactivar_nodo_y_hijos(nodo: Node):
	# Desactivar el procesamiento del nodo actual
	nodo.set_process(false)
	nodo.set_physics_process(false)
	
func Die():
	
	var rng = RandomNumberGenerator.new()
	
	var size = Vector2(get_viewport().size)
	position = player_cam.global_position
	position -= size / 2.0
	
	position.x += rng.randf_range(0,size.x)
	position.y -= 500
	
	health_system.SetCurrentHealth(1000)
