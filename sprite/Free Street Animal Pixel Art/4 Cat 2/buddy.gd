extends Node2D
@onready var cat = $"../Player"

func _ready():
	$AnimatedSprite2D.flip_h = true
	$AnimatedSprite2D.play("idle_buddy")
	
func _on_area_2d_body_entered(body: Node2D):
	cat.SPEED = 2000
	print(cat.SPEED)
	pass # Replace with function body.
