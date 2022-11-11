extends Node3D

@onready var Head = $TowerBase/TowerHeadJoint
@onready var TargetSphere : MeshInstance3D = $DebugSphere
@onready var ShootTimer : Timer = $ShootTimer
@onready var BulletSpawnPoint : Node3D = $TowerBase/TowerHeadJoint/BulletSpawnPoint

@export var Bullet : PackedScene


var enemies = []
var current_enemy : PathFollow3D

func _ready():
	ShootTimer.timeout.connect(fire)
	ShootTimer.start
	ShootTimer.wait_time = 0.1
	
func _process(delta):
	if !current_enemy:
		set_target(0)
		
func _physics_process(delta):
	if current_enemy != null:
		Head.look_at(current_enemy.global_position)

func _on_sight_area_entered(area: Area3D):
	if area.is_in_group("Enemy"):
		add_enemy(area.get_parent())
		set_target(0)

func _on_sight_area_exited(area: Area3D):
	if area.is_in_group("Enemy"):
		remove_enemy(area.get_parent())

func add_enemy(enemy : PathFollow3D):
	enemies.append(enemy)
	enemies.sort_custom(enemy_sort)
	
func remove_enemy(enemy : PathFollow3D):
	enemies.erase(enemy)
	if current_enemy == enemy:
		set_target(0)

func enemy_sort(a : PathFollow3D, b : PathFollow3D):
	return a.progress_ratio > b.progress_ratio

func acquire_target_from_list():
	if !enemies.is_empty():
		set_target(0)

func set_target(index : int):
	if !enemies.is_empty():
		current_enemy = enemies[0]

func fire():
	if current_enemy:
		var projectile = Bullet.instantiate()
		projectile.global_position = BulletSpawnPoint.global_position
		projectile.target = current_enemy
		get_tree().root.add_child(projectile)
