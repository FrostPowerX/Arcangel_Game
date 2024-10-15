extends Node2D

@onready var cannon1 = $Cannon1
@onready var cannon2 = $Cannon2
@export var bulletSpeed = 1000

@onready var spriteCannon = $Sprite2D

var origin : Vector2 = Vector2.ZERO 
var bullet = preload("res://Scenes/bullet.tscn")

func _ready():
	var playerSpeed = get_parent().speed
	bulletSpeed = bulletSpeed + playerSpeed

func _process(delta):
	cannonUpdate()
	getFireInput()


func cannonUpdate():
	var mousePos = get_global_mouse_position()
	look_at(get_global_mouse_position())
	rotate(1.5)

func getFireInput():
	if(Input.is_action_just_released("fire")):
		#Instancio balas
		var bulletInstance1 = bullet.instantiate()
		var bulletInstance2 = bullet.instantiate()
		
		# Obtengo la direccion de disparo y seteo:
		var direction = global_position.direction_to(get_global_mouse_position())
		# Direccion, velocidad y posicion
		bulletInstance1.initializeBullet(direction, bulletSpeed, cannon1.global_position)
		bulletInstance2.initializeBullet(direction, bulletSpeed, cannon2.global_position)
		
		get_parent().add_child(bulletInstance1)
		get_parent().add_child(bulletInstance2)
