extends Particles2D

# Node references
onready var life_timer :Timer = $LifeTimer

func _ready() -> void:
	one_shot = true
	life_timer.wait_time = lifetime

func _on_lifetime_timeout() -> void:
	queue_free()
