extends CharacterBody2D

## Speed of the bullet
@export var speed :int = 400

## Player tag
@export var player_tag :String = "player"

@onready var hit_audio :AudioStreamPlayer = $HitAudio

func _ready() -> void:
	# Calculate velocity
	var forward_vector := Vector2.UP.rotated(rotation)
	velocity = forward_vector * speed

func _physics_process(delta :float) -> void:
	# Update movement
	var collision = move_and_collide(velocity * delta)
	if collision != null:
		# Destroy the player on collision
		if collision.get_collider().is_in_group(player_tag):
			collision.get_collider().emit_signal("killed")
			queue_free()
			return
		
		# Update velocity on collision
		velocity = velocity.bounce(collision.get_normal())
		
		hit_audio.play()

func _on_lifetime_timeout():
	queue_free()
