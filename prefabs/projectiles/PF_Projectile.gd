extends PathFollow3D

@export var PathSpeed : float =  1

signal path_complete

func _physics_process(delta):
	progress += PathSpeed * delta
	if progress_ratio >= 1.0:
		path_complete.emit()
