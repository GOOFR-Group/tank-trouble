extends KinematicBody2D

# Speed to move the tank forward/backwards 
export var speed :int = 200 

# Speed to rotate the tank to the left/right
export var rotation_speed :int = 1.5

# Delay in seconds between shoots
export var shoot_delay :float = 1
var current_shoot_delay :float = 0

# "Private" variable to move the tank
var velocity :Vector2 = Vector2.ZERO

func _process(delta :float):
	# Update timers	
	current_shoot_delay = clamp(current_shoot_delay + delta, 0, shoot_delay)
	
	# Shoot
	if Input.is_action_pressed("p1_shoot") and current_shoot_delay == shoot_delay:
		print("Shoot") # TODO: Implement this action
		current_shoot_delay = 0

func _physics_process(delta :float):
	# Rotate
	var rotation_direction = _input_rotate()
	rotation += rotation_direction * rotation_speed * delta
	
	# Move
	_input_move()
	velocity = velocity.rotated(rotation)
	velocity = move_and_slide(velocity)
	pass

## Update rotation
## This function must be override
func _input_rotate() -> float:
	return 0.0

## Update movement
## This function must be override
func _input_move() -> void:
	pass
