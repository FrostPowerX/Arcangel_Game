extends Node2D

@onready var cannon1: Node2D = $Cannon1
@onready var cannon2: Node2D = $Cannon2

@export var trackMouse : bool = false
@export var bulletSpeed = 300

var origin : Vector2 = Vector2.ZERO
var bullet = preload("res://Scenes/bullet.tscn")

func _ready():
	var playerSpeed = get_parent().speed
	bulletSpeed = bulletSpeed + playerSpeed

func _process(delta):
	cannonUpdate()
	getFireInput()


func cannonUpdate():
	if(trackMouse):
		look_at(get_global_mouse_position())
	else:
		look_at(get_parent().GetTarget().position)

func getFireInput():
	if(Input.is_action_just_released("fire")):
		#Instancio balas
		var bulletInstance1 = bullet.instantiate()
		var bulletInstance2 = bullet.instantiate()
		
		# Obtengo la direccion de disparo y seteo:
		# Direccion, velocidad y posicion
		var direction = global_position.direction_to(get_global_mouse_position())
		bulletInstance1.initializeBullet(direction, bulletSpeed, cannon1.global_position)
		bulletInstance2.initializeBullet(direction, bulletSpeed, cannon2.global_position)
		
		get_parent().get_parent().add_child(bulletInstance1)
		get_parent().get_parent().add_child(bulletInstance2)
