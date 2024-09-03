extends Control

var startButton : Button
var creditsButton : Button
var quitButton : Button

func _ready():
	pass # 


func _process(delta):
	pass


func StartGame():
	get_tree().change_scene_to_file("res://Scenes/test.tscn")

func QuitGame():
	get_tree().quit()
