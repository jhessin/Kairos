class_name C_Dialogue
extends Component

@export var speaker_name: String = ''

@export_multiline var lines: Array[String] = []


func has_dialogue() -> bool:
	return not lines.is_empty()
