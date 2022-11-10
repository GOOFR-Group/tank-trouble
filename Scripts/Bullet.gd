extends KinematicBody2D

# Speed to move
export var speed :int = 400 

# Lifetime
export var lifetime :float = 5
var current_lifetime :float = 0

func _process(delta :float) -> void:
	# Update timers
	current_lifetime = clamp(current_lifetime + delta, 0, lifetime)
	
	# Destroy the bullet if it reaches its lifetime
	if current_lifetime >= lifetime:
		_destroy()

func _physics_process(delta :float) -> void:
	# Calculate forward vector
	var current_rotation := transform.get_rotation()
	var forward_vector := Vector2.UP.rotated(current_rotation)
	
	# Update movement
	var collision = move_and_collide(forward_vector * speed * delta)
	
	# Update rotation on collision
	if collision != null:
		# if collision == tank
		# destroy tank
		# _destroy()
		# return
		
		var direction = (-collision.normal).reflect(forward_vector)
		rotation = direction.angle_to(Vector2.UP)
	
# Destroys the bullet
func _destroy() -> void:
	queue_free()
