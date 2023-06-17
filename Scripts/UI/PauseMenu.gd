extends CanvasLayer

func _ready() -> void:
	var error := GameManager.connect("game_over", self, "game_over")
	if error != OK:
		push_error("PauseMenu failed to connect the game_over signal.")

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		if get_tree().paused:
			_hide_pause_menu()
		else:
			_show_pause_menu()

func game_over(_winner: String) -> void:
	hide()

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
