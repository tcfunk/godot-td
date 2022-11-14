extends Node3D

@onready var Camera : Camera3D = $Camera

@export var Map : GridMap

var ray_query_params : PhysicsRayQueryParameters3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1:
		var from = Camera.project_ray_origin(event.position)
		var to = from + Camera.project_ray_normal(event.position) * Camera.far
		
		ray_query_params = PhysicsRayQueryParameters3D.create(from, to)
		var hit = get_world_3d().direct_space_state.intersect_ray(ray_query_params)
		
		if hit:
			print("global position: ", hit.position)
			var local_hit = Map.to_local(hit.position)
			print("local position:  ", local_hit)
			var map_position = Map.local_to_map(local_hit)
			print("Map position:    ", map_position)
