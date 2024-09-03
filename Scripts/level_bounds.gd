extends Node2D

@onready var leftBound = $leftWall
@onready var rightBound = $rightWall
@export var nextSection : Node2D

const SectionLength : float = 800.0
const SectionAmount : int = 3;
func MoveBound(): 
	position.y -= SectionLength * SectionAmount
