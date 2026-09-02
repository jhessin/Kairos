class_name C_DialogueState
extends Component

var active: bool = false
var player: Entity = null # player
var npc: Entity = null # NPC
var definition: C_Dialogue
var current_node_id: StringName
var pending_choice_index := -1


func start(
	_player: Entity,
	_npc: Entity,
	dialogue_definition: C_Dialogue,
	entry_node_id: StringName,
) -> bool:
	if dialogue_definition == null or dialogue_definition.graph == null:
		return false

	var errors := dialogue_definition.graph.validate()

	if not errors.is_empty():
		print(errors)
		return false

	active = true
	player = _player
	npc = _npc
	definition = dialogue_definition
	current_node_id = entry_node_id
	pending_choice_index = -1

	return true


func close() -> void:
	active = false
	player = null
	npc = null
	definition = null
	current_node_id = ''
	pending_choice_index = -1


func get_current_node() -> DialogueNode:
	if not active or definition == null or definition.graph == null:
		return null

	return definition.graph.get_node(current_node_id)


func has_choice() -> bool:
	var node := get_current_node()
	return node != null and not node.choices.is_empty()


func queue_choice(index: int):
	var node := get_current_node()

	if node == null:
		return

	if index in range(get_current_node().choices.size()):
		pending_choice_index = index


func consume_pending_choice() -> DialogueChoice:
	var node := get_current_node()

	if node == null:
		return null

	if pending_choice_index not in range(node.choices.size()):
		pending_choice_index = -1
		return null

	var choice := node.choices[pending_choice_index]
	pending_choice_index = -1
	return choice


func go_to(node_id: StringName) -> bool:
	if definition == null or definition.graph == null:
		return false

	if definition.graph.get_node(node_id) == null:
		return false

	current_node_id = node_id
	return true
