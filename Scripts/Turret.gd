extends Node2D

<<<<<<< HEAD
@onready var cannon1: Node2D = $Cannon1
@onready var cannon2: Node2D = $Cannon2

@export var trackMouse : bool = false
@export var bulletSpeed = 1000

var origin : Vector2 = Vector2.ZERO
var bullet = preload("res://Scenes/bullet.tscn")

# Called when the node enters the scene tree for the first time.
=======
@onready var cannon1 = $Cannon1
@onready var cannon2 = $Cannon2
@export var bulletSpeed = 1000

@onready var spriteCannon = $Sprite2D
var origin : Vector2 = Vector2.ZERO 
var bullet = preload("res://Scenes/bullet.tscn")

>>>>>>> Tomi_Test
func _ready():
	var playerSpeed = get_parent().speed
	bulletSpeed = bulletSpeed + playerSpeed

<<<<<<< HEAD
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
=======
func _process(delta):
>>>>>>> Tomi_Test
	cannonUpdate()
	getFireInput()


func cannonUpdate():
<<<<<<< HEAD
	if(trackMouse):
		look_at(get_global_mouse_position())
	else:
		look_at(get_parent().GetTarget().position)
=======
	var mousePos = get_global_mouse_position()
	look_at(get_global_mouse_position())
	rotate(1.5)
>>>>>>> Tomi_Test

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
		
<<<<<<< HEAD
		print(cannon1.global_position);
		
=======
>>>>>>> Tomi_Test
		get_parent().add_child(bulletInstance1)
		get_parent().add_child(bulletInstance2)
