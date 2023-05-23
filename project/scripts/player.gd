extends Node2D

class_name Player

@export var rotate_speed = 5
var velocity = Vector2.ZERO
var thrust = 0

func _process(delta):
	#get input and rotate the player
	
	var rot = Input.get_axis("Left", "Right") * rotate_speed
	rotate(rot * delta)
	
	
	#move with thrust
	
	thrust = Input.get_action_strength("Thrust")
	velocity += transform.x * thrust * 20 
	velocity = lerp(velocity, Vector2.ZERO, 1 * delta)
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


func _on_player_area_entered(area):
	#get_tree().reload_current_scene()
	pass
	
