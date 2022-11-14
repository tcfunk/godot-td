extends Path3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$PathFollow3d.connect("path_complete", _complete)

func _complete():
	queue_free()
