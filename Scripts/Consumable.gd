extends Area2D

@export var consumablePoints = 10

func SetRandomPos():
	
	pass

func _on_body_entered(body: Node2D) -> void:
	if ( body.is_in_group("Player")):
		body.AddScore(consumablePoints)
