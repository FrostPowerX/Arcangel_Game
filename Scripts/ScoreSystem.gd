extends Node2D

@export var maxScore: float = 100
@export var currentScore: float = 0
@export var hasWon: bool = false 

func _ready() -> void:
	pass 

func _process(delta: float):
	if (currentScore == maxScore):
		hasWon = true
		change_scene_to_file("res/Scenes/GameOver")

func Add(scoreToAdd: float):
	currentScore += scoreToAdd

func SetMaxScore(value: float):
	maxScore = value;

func GetScore() -> float:
	return currentScore

func GetMaxScore() -> float:
	return maxScore
