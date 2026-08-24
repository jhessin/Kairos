@tool
class_name NPCEntity
extends Entity

@export var npc_name: String = "Elder"

@export_multiline var dialogue_lines: Array[String] = [
	'Welcome to Kairos, traveler.',
	'There is much to discover in this world.',
	'Speak with the people you meet.',
	'They may know more than they first reveal.',
]


func define_components() -> Array:
	var interactable := C_Interactable.new()

	interactable.interaction_name = 'talk'
	interactable.enabled = true

	var dialogue := C_Dialogue.new()

	dialogue.speaker_name = npc_name
	dialogue.lines = dialogue_lines

	var behavior := C_InteractionBehavior.new()
	behavior.callback = _on_interact

	return [interactable, dialogue, behavior]


func _on_interact(source: Entity) -> void:
	var dialogue_state := (source.get_component(C_DialogueState) as C_DialogueState)

	if dialogue_state == null:
		return

	var dialogue := get_component(C_Dialogue) as C_Dialogue

	if dialogue == null:
		return

	if not dialogue.has_dialogue():
		return

	dialogue_state.start(dialogue.speaker_name, dialogue.lines, source, self)
