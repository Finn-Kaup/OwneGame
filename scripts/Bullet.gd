extends Area2D


const SPEED = 1000
const RANGE = 2000
var travelled_distance = 0

func _physics_process(delta):
	
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	
	travelled_distance += SPEED * delta
	if travelled_distance > RANGE:
		queue_free()


func _on_body_entered(body):
	queue_free()

