@tool
class_name NPCEntity
extends Entity

@export var npc_name: String = "Elder"
@export var graph: DialogueGraph


func define_components() -> Array:
	var interactable := C_Interactable.new()

	interactable.interaction_name = 'talk'
	interactable.enabled = true

	var dialogue := C_Dialogue.new()

	dialogue.speaker_name = npc_name
	dialogue.graph = graph

	var behavior := C_InteractionBehavior.new()
	behavior.callback = _on_interact

	return [
		interactable,
		dialogue,
		behavior,
		# quest_objective,
	]


func _on_interact(player: Entity) -> void:
	var dialogue_state := player.get_component(C_DialogueState) as C_DialogueState
	var quest_state := player.get_component(C_QuestState) as C_QuestState
	var dialogue := get_component(C_Dialogue) as C_Dialogue

	if dialogue_state == null or quest_state == null or dialogue == null:
		return

	if not dialogue.has_dialogue():
		return

	var entry_node_id := dialogue.graph.resolve_entry_node(quest_state)

	if entry_node_id.is_empty():
		push_error("Dialogue graph has no valid entry node.")
		return

	dialogue_state.start(player, self, dialogue, entry_node_id)
