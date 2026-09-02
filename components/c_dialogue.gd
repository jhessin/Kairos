class_name C_Dialogue
extends Component

@export var speaker_name: String = ''

@export var graph: DialogueGraph


func has_dialogue() -> bool:
	return graph != null and not graph.default_entry_node_id.is_empty()
