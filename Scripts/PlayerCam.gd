extends Camera2D

@export var target = CharacterBody2D
@onready var offSet: float = 150.0


# Called when the node enters the scene tree for the first time.
func _process(delta):
	position.y = target.position.y - offSet 


