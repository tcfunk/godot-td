extends Area3D

var move = Vector3.ZERO
var speed = 30
var look_vec = Vector3.ZERO
var target : Node3D
var damage = 3

# Called when the node enters the scene tree for the first time.
#func _ready():
#	if target != null:
#		look_at(target.global_position)
#		look_vec = (target.global_position - global_position).normalized()
#	else:
#		queue_free()
#
#func _physics_process(delta):
#	move = move.move_toward(look_vec, delta * speed)
#	position += move
