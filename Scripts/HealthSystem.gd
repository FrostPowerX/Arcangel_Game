extends Node

@export var maxHealth: float = 100
@export var currentHealth: float = maxHealth

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func SetCurrentHealth(health: float):
	currentHealth = health if health <= maxHealth else maxHealth

func SetMaxHealth(mxHealth: float):
	maxHealth = mxHealth
	currentHealth = mxHealth

func GetCurrentHealth() -> float:
	return currentHealth

func GetMaxHealth() -> float:
	return maxHealth

func TakeDamage(dmg: float):
	currentHealth -= dmg if dmg < currentHealth else currentHealth

func IsAlive() -> bool:
	return (currentHealth > 0)
