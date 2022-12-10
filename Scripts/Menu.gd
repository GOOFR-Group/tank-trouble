extends Control

func _on_PlayBTN_pressed():
	get_tree().change_scene("res://Scenes/MainScene.tscn")

func _on_ExitBTN_pressed():
	get_tree().quit()
