extends CanvasLayer

func _process(_delta: float) -> void:
	if GameManager.is_game_over:
		return
	
	if Input.is_action_just_pressed("ui_cancel"):
		if get_tree().paused:
			_hide_pause_menu()
		else:
			_show_pause_menu()

func _show_pause_menu() -> void:
	get_tree().paused = true
	$AnimationPlayer.play("show")
	
func _hide_pause_menu() -> void:
	get_tree().paused = false
	$AnimationPlayer.play("RESET")

func _on_menu_button_pressed() -> void:
	get_tree().paused = false
	GameManager.is_game_over = false
	
	var error := get_tree().change_scene("res://Levels/MenuLevel.tscn")
	if error != OK:
		push_error("PauseMenu failed to change to Menu.")
		
func _on_resume_button_pressed() -> void:
	_hide_pause_menu()
