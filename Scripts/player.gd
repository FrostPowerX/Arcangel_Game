extends CharacterBody2D

@export var upVelMulti: float = 1
@export var speed: float = 600
@export var maxLife: float= 3
@export var life: float= maxLife

@onready var sprite=$Sprite2D
@onready var camera=$Camera2D

var useVelMulti: float = 0

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

func TakeDamage(dmg):
	life -= dmg
	print(life)
	if (life <= 0):
		Die()

func Die():
	queue_free()
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
