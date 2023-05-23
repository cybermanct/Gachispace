extends Node2D

class_name Asteroid

#custom signal
signal asteroid_destroyed

var velocity = Vector2.ZERO

func _ready():
	randomize()
	var x = randf_range(-100, 100)
	var y = randf_range(-100, 100)
	velocity = Vector2(x, y)
	
func _process(delta):
	position += velocity * delta
	g_wrap()
	
func g_wrap():
	if position.x < 0:
		position.x = 700
	if position.x > 700:
		position.x = 0
	if position.y < 0:
		position.y = 500
	if position.y > 500:
		position.y = 0

func _on_area_entered(area):
	if area is Bullet:
		emit_signal("asteroid_destroyed")
		area.queue_free()
		queue_free()

func _on_asteroid_destroyed():
	print("kaboom")
