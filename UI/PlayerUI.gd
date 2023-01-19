extends VBoxContainer

func update_player(color: Color, controls: String, name: String) -> void:
	$Tank.modulate = color
	$Controls.text = controls
	$Name.text = name
