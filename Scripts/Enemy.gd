extends CharacterBody2D
class_name Enemy
@export var speed: float = 300
@export var target: CharacterBody2D 

func _process(_delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	position = position.move_toward(target.position, speed * delta)
	move_and_slide()

func GetTarget():
	return target
	
func SetTarget(newTarget: CharacterBody2D):
	target = newTarget
