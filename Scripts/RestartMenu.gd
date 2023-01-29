extends CanvasLayer

func _ready() -> void:
	hide()
	
	var error := GameManager.connect("game_over", self, "game_over")
	if error != OK:
		push_error("RestartMenu failed to connect the game_over signal.")

func game_over(player_killed: String) -> void:
	show()
	
	$Background/Label.text = player_killed + " is Dead!"
	$AnimationPlayer.play("show")

func _on_restart_button_pressed() -> void:
	GameManager.restart_game()

func _on_exit_button_pressed() -> void:
	GameManager.is_game_over = false
	var error := get_tree().change_scene("res://UI/Menu.tscn")
	if error != OK:
		push_error("Failed to exit game.")
