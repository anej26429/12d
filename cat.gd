extends CharacterBody2D

# Declaring variables.
@export var SPEED = 130.0
@export var JUMP_VELOCITY = -600.0

# Calls upon the antimation library.
@onready var animated_sprite_2d = $AnimatedSprite2D


func _physics_process(delta):
	
	# Defining
	var direction_x := Input.get_axis("move_left", "move_right")
	var direction_y := Input.get_axis("move_up", "move_down")
	
	# Moving left or right.
	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	# Moving up or down.
	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	# Walking animations.
	if direction_x > 0:
		animated_sprite_2d.flip_h = false	
		animated_sprite_2d.play("walk")		
		
	elif direction_x < 0:
		animated_sprite_2d.flip_h = true	
		animated_sprite_2d.play("walk")
		
	elif direction_y > 0:
		animated_sprite_2d.play("walk")
		
	elif direction_y < 0:
			animated_sprite_2d.play("walk")
	else:
		animated_sprite_2d.play("idle")
		
	move_and_slide()
