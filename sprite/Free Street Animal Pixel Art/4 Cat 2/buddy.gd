extends CharacterBody2D

func _ready():
	$AnimatedSprite2D.flip_h = true
	$AnimatedSprite2D.play("idle_buddy")
