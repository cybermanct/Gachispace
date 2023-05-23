extends Node2D

#game script spawn in a number of asteroids at start

#number of asteroids
@export var num_asteroids = 10
var asteroids_left = 0

#spawn asteroid when node is ready
@onready var asteroid = preload("res://project/scenes/asteroid.tscn")
#spawn bullet when is ready
@onready var bullet = preload("res://project/scenes/bullet.tscn")

func _ready():
	spawn_wave()

func get_random_position():
	#return a random screen position
	randomize()
	var v = Vector2(randf_range(0, 1024), randf_range(0, 600))
	return v
	
func _process(_delta):
	#check for keys and shoot the bullet
	if Input.is_action_just_pressed("Shoot"):
		#shoot the bullet
		var new_bullet = bullet.instantiate()
		new_bullet.position = $Player.position
		new_bullet.rotation = $Player.rotation
		add_child(new_bullet)
		#FUCK YOU GODOT (crashes when from other scene)
#		$Player/Bullet/AudioStreamPlayer.play()
		#rewrite for issue
		
func _on_asteroid_destroyed():
	$ExplosionAsteroid.play()
	asteroids_left -= 1
	if asteroids_left == 0:
		num_asteroids += 2
		spawn_wave()
	
func spawn_wave():
	#spawn number of asteroids
	for i in num_asteroids:
		var new_asteroid = asteroid.instantiate()
		new_asteroid.position = get_random_position()
		new_asteroid.asteroid_destroyed.connect(self._on_asteroid_destroyed)
		add_child(new_asteroid)
		asteroids_left += 1
