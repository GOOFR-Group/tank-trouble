extends CanvasLayer

func _ready() -> void:
	hide()
	GameManager.connect("gameOver", self, "gameOver")

func gameOver(playerkilled: String) -> void:
	show()
	$Background/Label.text = playerkilled + " is Dead!"
	$AnimationPlayer.play("show")

func _on_restart_button_down() -> void:
	get_tree().reload_current_scene()
