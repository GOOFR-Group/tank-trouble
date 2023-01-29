extends Control

func _init() -> void:
	var error := GameManager.connect("debug_mode_changed", self, "_on_debug_mode_changed")
	if error != OK:
		push_error("Menu failed to connect the debug_mode_changed signal.")

func _on_play_button_pressed() -> void:
	$PlayerSelection.show()

func _on_debug_button_pressed() -> void:
	GameManager.toggle_debug_mode()

func _on_exit_button_pressed():
	get_tree().quit()

func _on_debug_mode_changed(__ :bool, new :bool) -> void:
	var debug_button :Button = $ControlButtons/HBoxContainer/DebugBTN
	
	var text :String = "Debug: OFF"
	if new:
		text = "Debug: ON"

	debug_button.text = text
