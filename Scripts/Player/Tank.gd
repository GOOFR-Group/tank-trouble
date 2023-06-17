extends KinematicBody2D

# warning-ignore:unused_signal
signal killed()

# Wheel animations
const WHEEL_ANIMATION_IDLE :String = "Idle"
const WHEEL_ANIMATION_BOTH_FORWARD :String = "BothForward"
const WHEEL_ANIMATION_BOTH_BACKWARDS :String = "BothBackwards"
const WHEEL_ANIMATION_LEFT_FORWARD_RIGHT_BACKWARDS :String = "LeftForwardRightBackwards"
const WHEEL_ANIMATION_LEFT_BACKWARDS_RIGHT_FORWARD :String = "LeftBackwardsRightForward"

## Player name
export var playerName :String = ""

## Speed to move the tank forward/backwards
export var speed :float = 150 

## Speed to rotate the tank to the left/right
export var rotation_speed :float = 5

## Defines if the player is able to shoot
var _can_shoot :bool

# Scenes
onready var main_level = get_node("/root/MainLevel")
onready var bullet_scene = preload("res://Prefabs/Player/Bullet.tscn")
onready var explosion_scene = preload("res://Prefabs/Particles/Explosion.tscn")

# Node references
onready var animated_sprite :AnimatedSprite = $AnimatedSprite
onready var bullet_spawn_point :Position2D = $BulletSpawnPoint
onready var bullet_timer :Timer = $BulletTimer
onready var explosion_audio :AudioStreamPlayer = $ExplosionAudio

func _ready():
	_can_shoot = true
	
	_change_wheel_animation(WHEEL_ANIMATION_IDLE)

func _process(__ :float):
	if GameManager.is_game_over:
		return
	
	# Shoot
	if _input_shoot() && _can_shoot:
		# Spawn bullet
		var bullet = bullet_scene.instance()
		bullet.set_position(bullet_spawn_point.get_global_position())
		bullet.set_rotation(bullet_spawn_point.get_global_rotation())
		main_level.add_child(bullet)
		
		# Reset bullet timer
		bullet_timer.start()
		_can_shoot = false

func _physics_process(delta :float):
	# Get inputs
	var rotation_direction = _input_rotate()
	var move_direction = _input_move()
	
	# Rotate
	if move_direction == -1:
		# Reverse the rotation direction when moving backwards
		rotation_direction = -rotation_direction
	
	rotation += rotation_direction * rotation_speed * delta
	
	# Move
	var forward_vector := Vector2.UP.rotated(rotation)
	var velocity = move_direction * forward_vector * speed
	velocity = move_and_slide(velocity)
	
	# Player is rotating left
	if rotation_direction == -1:
		_change_wheel_animation(WHEEL_ANIMATION_LEFT_BACKWARDS_RIGHT_FORWARD)
	# Player is rotating right
	elif rotation_direction == 1:
		_change_wheel_animation(WHEEL_ANIMATION_LEFT_FORWARD_RIGHT_BACKWARDS)
	# Player is not rotating
	else:
		# Player is moving backwards
		if move_direction == -1:
			_change_wheel_animation(WHEEL_ANIMATION_BOTH_BACKWARDS)
		# Player is moving forward
		elif move_direction == 1:
			_change_wheel_animation(WHEEL_ANIMATION_BOTH_FORWARD)
		# Player is not moving
		else:
			_change_wheel_animation(WHEEL_ANIMATION_IDLE)

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
	
## Returns true to shoot
## This function must be override
func _input_shoot() -> bool:
	return false

func _change_wheel_animation(animation :String) -> void:
	animated_sprite.play(animation)

func _disable() -> void:
	hide()
	
	var collision_shape :CollisionShape2D = $Collision
	if collision_shape != null:
		collision_shape.disabled = true

func _on_shoot_timeout():
	_can_shoot = true

func _on_killed() -> void:
	if GameManager.is_game_over:
		return
	
	# Killing event
	GameManager.kill_player(playerName)
	
	# Hide child nodes
	_disable()
	
	# Spawn explosion
	var explosion = explosion_scene.instance()
	explosion.set_position(position)
	main_level.add_child(explosion)
	
	# Play explosion audio
	explosion_audio.play()
	yield(explosion_audio, "finished")
	
	# Destroy self
	queue_free()
