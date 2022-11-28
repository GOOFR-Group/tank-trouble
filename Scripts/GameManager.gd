extends Node

signal gameOver(playerkilled)

func gameOver(playerkilled: String) -> void:
	emit_signal("gameOver", playerkilled)
