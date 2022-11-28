extends CanvasLayer

func _ready() -> void:
	hide()
	GameManager.connect("gameOver", self, "gameOver")

func gameOver(playerkilled: String) -> void:
	print("playerkilled -> ", playerkilled)
	show()
	$Background/Label.text = playerkilled + " is Dead!"
	$AnimationPlayer.play("show")

func _on_RestartBTN_button_down() -> void:
	get_tree().reload_current_scene()
