extends KinematicBody2D

# Speed to move the tank forward/backwards 
export var speed :int = 200 

# Speed to rotate the tank to the left/right
export var rotation_speed :int = 200

# Delay in seconds between shoots
export var shoot_delay :float = 1
var current_shoot_delay :float = 0

func _process(delta :float):
	# Update timers	
	current_shoot_delay = clamp(current_shoot_delay + delta, 0, shoot_delay)
	
	# Shoot
	if Input.is_action_pressed("shoot") and current_shoot_delay == shoot_delay:
		print("Shoot") # TODO: Implement this action
		current_shoot_delay = 0

func _physics_process(delta :float):
	# Update rotation
	if Input.is_action_pressed("rotate_left"):
		rotate(deg2rad(-rotation_speed) * delta)
	elif Input.is_action_pressed("rotate_right"):
		rotate(deg2rad(rotation_speed) * delta)
	
	# Calculate forward vector
	var current_rotation := transform.get_rotation()
	var forward_vector := Vector2.UP.rotated(current_rotation)
	
	# Update movement
	if Input.is_action_pressed("move_forward"):
		move_and_collide(forward_vector * rotation_speed * delta)
	elif Input.is_action_pressed("move_backwards"):
		move_and_collide(-forward_vector * rotation_speed * delta)
