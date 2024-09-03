extends Node2D

@export var Cannon1 : Node2D
@export var Cannon2 : Node2D
var origin : Vector2 = Vector2.ZERO
@onready var spriteCannon = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mousePos = get_viewport().get_mouse_position()
	var direction = (mousePos - position).normalized()
	spriteCannon.look_at(get_global_mouse_position())
	spriteCannon.rotate(1.5)
	
