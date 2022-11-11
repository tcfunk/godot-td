extends PathFollow3D

var health = 5
var speed = 3
var gold = 5

signal cash_money(amount)

func _init():
	set_loop(false)
	
func _physics_process(delta):
	progress += speed * delta
	if progress_ratio >= 1.0:
		queue_free()


func _on_area_3d_area_entered(area : Area3D):
	if area.is_in_group("Projectile"):
		area.queue_free() # delete the projectile
		health -= area.damage
		
		if health <= 0:
			emit_signal("cash_money", gold)
			queue_free()
