extends CharacterBody2D

@export var upVelMulti: float = 1
@export var speed: float = 600

@onready var health_system: Node = $HealthSystem

var useVelMulti: float = 0

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
	
	velocity = Vector2(directionX * speed, -useVelMulti * speed)
	#print(velocity)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	Movement(_delta)
	move_and_slide()

func Die():
	hide()
