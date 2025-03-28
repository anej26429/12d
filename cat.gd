extends CharacterBody2D
# Cat character script for a 2D game in Godot Engine
# This script handles the movement and jumping of a cat character
# It uses the CharacterBody2D node for physics-based movement
# The cat can move in four directions (up, down, left, right) and jump


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

@onready var animated_sprite_2d = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	# Get both horizontal and vertical input
	var direction_x := Input.get_axis("move_left", "move_right")
	var direction_y := Input.get_axis("move_up", "move_down")
	
	# Handle horizontal movement
	if direction_x:
		velocity.x = direction_x * SPEED
		animated_sprite_2d.play("idle")
		# This plays the animation based on the direction
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite_2d.pause()
		# This stops the animation if no input is given
	
	# Handle vertical movement
	if direction_y:
		velocity.y = direction_y * SPEED
		animated_sprite_2d.play("idle")
		# This plays the animation based on the direction
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		animated_sprite_2d.pause()
		# This stops the animation if no input is given

	move_and_slide()
