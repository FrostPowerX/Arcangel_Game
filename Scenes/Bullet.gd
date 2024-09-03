var rightMuzzlePos : Transform2D
var leftMuzzlePos : Transform2D
var bulletDirection : Vector2

func _process(delta):
	fireBullet()


func fireBullet():
	if(Input.is_action_pressed("fire")):
		print_debug("Dispare :D")
		#var bullet = preload("INSERTE_ESCENA_DE_BULLET")
		#var bulletInstance = bullet.instantiate()
		#add_child(bulletInstance)
		#bulletInstance.direction = Vector2.UP
