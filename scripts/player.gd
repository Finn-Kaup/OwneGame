extends CharacterBody2D

const WALLJUMPS = 1
const JUMPS = 1
const SPEED = 300.0
const JUMP_VELOCITY = -450.0

var jumps = JUMPS
var walljumps = WALLJUMPS

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var sprite = $AnimatedSprite2D
@onready var ray_cast_l = $RayCastL
@onready var ray_cast_r = $RayCastR

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Wall jump
	var ray_cast = ray_cast_l.is_colliding() or ray_cast_r.is_colliding()
	if ray_cast and Input.is_action_just_pressed("jump") and walljumps > 0:
		velocity.y = JUMP_VELOCITY
		walljumps -= 1

	# Double jump.
	if Input.is_action_just_pressed("jump")and not is_on_floor() and jumps > 0 and not ray_cast:
		velocity.y = JUMP_VELOCITY
		jumps -= 1

	# through slabs
	#if Input.is_action_just_pressed("move_down"):

	# jumps reset on floor
	if is_on_floor():
		jumps = JUMPS
		walljumps = WALLJUMPS

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_l", "move_r")

	#Player look right/left
	if direction == 0:
		sprite.play("idle")
	elif direction < 0:
		sprite.play("run_l")
	elif direction > 0:
		sprite.play("run_r")

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
