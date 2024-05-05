extends Area2D


# shoot function
func shoot():
	const BULLET = preload("res://scenes/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %ShootingPoint.global_position
	new_bullet.global_rotation = %ShootingPoint.global_rotation
	%ShootingPoint.add_child(new_bullet)


# shot when pressed "act"  every x sec
var isRady = true

func _on_timer_timeout():
	isRady = true

func _physics_process(delta):
	if Input.is_action_pressed("act") and isRady:
		shoot()
		isRady = false
	
	# gun look at mouse position 
	look_at(get_global_mouse_position())


