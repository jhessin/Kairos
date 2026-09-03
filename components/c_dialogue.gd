class_name C_Dialogue
extends Component

@export var speaker_name: String = ''

var data: DialogueData = null
var start_node: StringName = &''


func has_dialogue() -> bool:
	return data != null
