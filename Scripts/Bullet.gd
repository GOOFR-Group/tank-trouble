extends KinematicBody2D

## Speed of the bullet
export var speed :int = 400 

## Lifetime of the bullet
export var lifetime :float = 5
var current_lifetime :float = 0

## Player tag
export var player_tag :String = "player"

func _process(delta :float) -> void:
	# Update timers
	current_lifetime = clamp(current_lifetime + delta, 0, lifetime)
	
	# Destroy the bullet when it reaches its lifetime
	if current_lifetime >= lifetime:
		queue_free()

func _physics_process(delta :float) -> void:
	# Calculate forward vector
	var forward_vector := Vector2.UP.rotated(rotation)
	
	# Update movement
	var collision = move_and_collide(forward_vector * speed * delta)
		
	if collision != null:
		# Destroy the player on collision
		if collision.collider.is_in_group(player_tag):
			collision.collider.free()
			queue_free()
			return
		
		# Update the rotation on collision
		var direction = (-collision.normal).reflect(forward_vector)
		rotation = direction.angle_to(Vector2.UP)
		
