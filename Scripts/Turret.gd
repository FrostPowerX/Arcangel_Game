extends Node2D

@onready var cannon1: Node2D = $Cannon1
@onready var cannon2: Node2D = $Cannon2

@export var trackMouse : bool = false
@export var bulletSpeed : float = 300
@export var fireRate : float = 0.2
@export var layer : int = 0
@export var damage : int = 20

var fireTime

var origin : Vector2 = Vector2.ZERO
var bullet = preload("res://Scenes/bullet.tscn")

func _ready():
	fireTime = fireRate
	
	if (get_parent().speed):
		var playerSpeed = get_parent().speed
		bulletSpeed = bulletSpeed + playerSpeed

func _process(delta):
	cannonUpdate()
	getFireInput()
	fireTime -= delta


func cannonUpdate():
	if(trackMouse):
		look_at(get_global_mouse_position())
	else:
		look_at(get_parent().GetTarget().position)

func getFireInput():
	
	var drInit
	
	if(trackMouse):
		drInit = get_global_mouse_position()
	else:
		drInit = get_parent().GetTarget().position
	
	
	if((Input.is_action_just_released("fire") || !trackMouse) && fireTime <= 0):
		#Instancio balas
		var bulletInstance1 = bullet.instantiate()
		var bulletInstance2 = bullet.instantiate()
		
		bulletInstance1.SetLayerColision(layer)
		bulletInstance2.SetLayerColision(layer)
		
		# Obtengo la direccion de disparo y seteo:
		# Direccion, velocidad y posicion
		var direction = global_position.direction_to(drInit)
		bulletInstance1.initializeBullet(direction, bulletSpeed, cannon1.global_position, damage)
		bulletInstance2.initializeBullet(direction, bulletSpeed, cannon2.global_position, damage)
		
		get_parent().get_parent().add_child(bulletInstance1)
		get_parent().get_parent().add_child(bulletInstance2)
		
		fireTime = fireRate
