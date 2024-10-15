extends CharacterBody2D

@export var upVelMulti: float = 1
<<<<<<< HEAD
@export var speed: float = 600
=======
@export var speed: float = 0
@export var maxLife: float= 3
@export var life: float= maxLife
>>>>>>> Tomi_Test

@onready var health_system: Node = $HealthSystem

var useVelMulti: float = 0

<<<<<<< HEAD
func _process(_delta):
	if(!health_system.IsAlive()):
		Die()
	
=======
func _ready() -> void:
	add_to_group("PlayerGroup")


>>>>>>> Tomi_Test
func Movement(_delta):
	var directionX = Input.get_axis("left","right")
	
	if(Input.is_action_pressed("up")):
		useVelMulti = upVelMulti * 1.5
	elif (Input.is_action_pressed("down")):
		useVelMulti = upVelMulti * 0.6
	else:
		useVelMulti = upVelMulti
		
	velocity = Vector2(directionX * speed, -useVelMulti * speed)
	
	
	#print(velocity)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	Movement(_delta)
	move_and_slide()

func Die():
	hide()
