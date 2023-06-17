extends CanvasLayer

func _ready() -> void:
	hide()
	
	var error := GameManager.connect("game_over", self, "game_over")
	if error != OK:
		push_error("RestartMenu failed to connect the game_over signal.")

func game_over(winner: String) -> void:
	show()
	
	$Background/Label.text = winner + " won!"
	$AnimationPlayer.play("show")

func _on_menu_button_pressed() -> void:
	GameManager.is_game_over = false
	
	var error := get_tree().change_scene("res://Levels/MenuLevel.tscn")
	if error != OK:
		push_error("RestartMenu failed to change to Menu.")
		
func _on_restart_button_pressed() -> void:
	GameManager.restart_game()
