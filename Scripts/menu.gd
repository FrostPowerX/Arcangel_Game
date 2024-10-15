extends Control

var startButton : Button
var creditsButton : Button
var quitButton : Button

<<<<<<< HEAD
=======
func _ready():
	
	pass 


func _process(delta):
	
	pass


>>>>>>> Tomi_Test
func StartGame():
	get_tree().change_scene_to_file("res://Scenes/Test.tscn")
	pass

func QuitGame():
	get_tree().quit()
