extends CharacterBody2D
# Cat character script for a 2D game in Godot Engine
# This script handles the movement and jumping of a cat character
# It uses the CharacterBody2D node for physics-based movement
# The cat can move in four directions (up, down, left, right) and jump


const SPEED = 130.0
const JUMP_VELOCITY = -600.0
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") # Get the default gravity value from project settings

@onready var animated_sprite_2d = $AnimatedSprite2D # Reference to the AnimatedSprite2D node

# Add the gravity.
func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta

# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():	# Check if the jump action is pressed and the character is on the floor
		velocity.y = JUMP_VELOCITY

	# Get both horizontal and vertical input
	var direction_x := Input.get_axis("move_left", "move_right")
	var direction_y := Input.get_axis("move_up", "move_down")

	# Handle horizontal movement
	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Handle vertical movement
	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)

	# Update the animation based on the direction of movement
	if direction_x > 0:
		animated_sprite_2d.flip_h = false	# Flip sprite to face right
		animated_sprite_2d.play("walk")		# Play walk animation
	elif direction_x < 0:
		animated_sprite_2d.flip_h = true	# Flip sprite to face left
		animated_sprite_2d.play("walk")
	elif direction_y > 0:					# Move down
		animated_sprite_2d.play("walk")
	elif direction_y < 0:					# Move up
			animated_sprite_2d.play("walk")
	else:									# No movement
		animated_sprite_2d.play("idle") 	# Play idle animation

# Move the character
	move_and_slide()
