extends CanvasLayer

func _ready() -> void:
	hide()
	var error = GameManager.connect("gameOver", self, "gameOver")
	if error != OK:
		push_error("RestartMenu failed to connect the gameOver signal.")

func gameOver(playerkilled: String) -> void:
	show()
	$Background/Label.text = playerkilled + " is Dead!"
	$AnimationPlayer.play("show")

func _on_restart_button_down() -> void:
	var error = get_tree().reload_current_scene()
	if error != OK:
		push_error("Failed to restart the game.")
