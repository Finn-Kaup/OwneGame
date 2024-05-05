extends Area2D

@onready var collision_shape = $CollisionShape2D
@onready var animated_sprite = $AnimatedSprite2D
@onready var orbs = $".."

# orb löscht sich bei kontakt
# alternative nur bodys: _on_body_entered(body)
func _on_area_entered(area):
	queue_free()
	orbs.increase_score()

