extends CharacterBody2D
# Cat character script for a 2D game in Godot Engine
func _ready() -> void:
	$AnimatedSprite2D.flip_h = true
	$AnimatedSprite2D.play("idle_buddy")
func _on_area_2d_body_entered(Node2D) -> void:
	print("Nigger")
	pass # Replace with function body.
	
