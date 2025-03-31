extends CharacterBody2D
# Cat character script for a 2D game in Godot 
@onready var cat_speed = $Player

func _ready() -> void:
	$AnimatedSprite2D.flip_h = true
	$AnimatedSprite2D.play("idle_buddy")
func _on_area_2d_body_entered(_body) -> void:
	print("Player has entered the area")
	var cat_speed = 10.0
	pass # Replace with function body.
