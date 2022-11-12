extends KinematicBody2D

# Scenes
onready var main_scene = get_tree().root
onready var bullet_scene = preload("res://Prefabs/Bullet.tscn")
onready var bullet_spawn_point = get_node("./BulletSpawnPoint")

# Speed to move the tank forward/backwards 
export var speed :int = 200 
## Speed to move the tank forward/backwards 
export var speed :float = 200 

## Speed to rotate the tank to the left/right
export var rotation_speed :float = 1.5

## Delay in seconds between shoots
export var shoot_delay :float = 0.25
var current_shoot_delay :float = 0

func _process(delta :float):
	# Update timer
	current_shoot_delay = clamp(current_shoot_delay + delta, 0, shoot_delay)
	
	# Shoot
	if Input.is_action_pressed("p1_shoot") && current_shoot_delay == shoot_delay:
		var bullet = bullet_scene.instance()
		bullet.set_position(bullet_spawn_point.get_global_position())
		bullet.set_rotation(bullet_spawn_point.get_global_rotation())
		main_scene.add_child(bullet)
		
		# Reset timer
		current_shoot_delay = 0

func _physics_process(delta :float):
	# Rotate
	var rotation_direction = _input_rotate()
	rotation += rotation_direction * rotation_speed * delta
	
	# Move
	var forward_vector := Vector2.UP.rotated(rotation)
	var move_direction = _input_move()
	move_and_slide(move_direction * forward_vector * speed)

## Returns the direction of the rotation
## 0  = no rotation
## -1 = left
## 1  = right
## This function must be override
func _input_rotate() -> int:
	return 0

## Returns the direction of the movement
## 0  = no movement
## -1 = backwards
## 1  = forward
## This function must be override
func _input_move() -> int:
	return 0
