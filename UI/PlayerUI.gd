extends VBoxContainer

func update_player(_color: Color, _controls: String, _name: String) -> void:
	$Tank.modulate = _color
	$Controls.text = _controls
	$Name.text = _name
