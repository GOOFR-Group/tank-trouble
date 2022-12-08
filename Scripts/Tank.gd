extends KinematicBody2D

signal killed()

## Player name
export var playerName :String = "" 

## Speed to move the tank forward/backwards
export var speed :float = 150 

## Speed to rotate the tank to the left/right
export var rotation_speed :float = 5

## Defines if the player is able to shoot
var _can_shoot :bool

# Scenes
onready var main_scene = get_tree().root
onready var bullet_scene = preload("res://Prefabs/Bullet.tscn")
onready var explosion_scene = preload("res://Prefabs/Particles/Explosion.tscn")

# Node references
onready var bullet_spawn_point :Position2D = $BulletSpawnPoint
onready var bullet_timer :Timer = $BulletTimer

func _ready():
	_can_shoot = true

func _process(delta :float):
	# Shoot
	if _input_shoot() && _can_shoot:
		# Spawn bullet
		var bullet = bullet_scene.instance()
		bullet.set_position(bullet_spawn_point.get_global_position())
		bullet.set_rotation(bullet_spawn_point.get_global_rotation())
		main_scene.add_child(bullet)
		
		# Reset bullet timer
		bullet_timer.start()
		_can_shoot = false

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
	
## Returns true to shoot
## This function must be override
func _input_shoot() -> bool:
	return false
	
func _on_shoot_timeout():
	_can_shoot = true

func _on_killed() -> void:	
	# Spawn explosion
	var explosion = explosion_scene.instance()
	explosion.set_position(position)
	main_scene.add_child(explosion)
	
	# Destroy self
	queue_free()
	
	# Killing event
	GameManager.gameOver(playerName)
