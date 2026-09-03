class_name C_DialogueState
extends Component

var active: bool:
	get:
		return _active

var data: DialogueData = null
var start_node: StringName = &''

var player: Entity = null
var npc: Entity = null
var _active: bool = false


func setup(pplayer: Entity, nnpc: Entity, dialogue: DialogueData, start_id: StringName) -> void:
	data = dialogue
	player = pplayer
	npc = nnpc
	_active = dialogue != null
	start_node = start_id


func close() -> void:
	_active = false
	data = null
	start_node = &''
	player = null
	npc = null
