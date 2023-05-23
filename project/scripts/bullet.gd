extends Area2D

class_name Bullet

#bullet speed
@export var speed = 1000

func _process(_delta):
	#move the bullet
	position += transform.x * speed * _delta
	

func _on_timer_timeout():
	queue_free()
