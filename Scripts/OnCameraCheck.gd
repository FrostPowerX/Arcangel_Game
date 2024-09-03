extends VisibleOnScreenNotifier2D

@export var parent : Node2D

func _on_screen_exited():
	parent.MoveBound() 
	#TODO: rename or figure out how to
	# call these in a more generic way
