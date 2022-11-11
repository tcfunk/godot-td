extends Node3D

@onready var enemy_timer : Timer = $EnemyTimer
@onready var GoldLabel : Label = $GUI/GoldLabel
@onready var Map : GridMap = $Map

@export var enemy : PackedScene

var gold = 0

func _ready():
	enemy_timer.start()
	enemy_timer.wait_time = 1
	enemy_timer.timeout.connect(_enemy_timeout)
	get_money(100)

func _enemy_timeout():
	var inst = enemy.instantiate()
	$Path3d.add_child(inst)
	inst.connect("cash_money", get_money)

func get_money(amount):
	gold += amount
	GoldLabel.text = "Gold: " + str(gold)
