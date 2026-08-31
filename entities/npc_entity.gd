@tool
class_name NPCEntity
extends Entity

@export var npc_name: String = "Elder"

@export var quest_id: String
@export var quest_objective_id: String
@export var complete_objective_on_interact: bool = true

@export_range(0, 10, 1) var amount: int = 1

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

	var quest_objective := C_QuestObjective.new(quest_id, quest_objective_id, amount)

	return [interactable, dialogue, behavior, quest_objective]


func _on_interact(source: Entity) -> void:
	if complete_objective_on_interact:
		var request := source.get_component(C_QuestRequest) as C_QuestRequest
		var objective := get_component(C_QuestObjective) as C_QuestObjective

		request.from_objective(objective)

	var dialogue_state := (source.get_component(C_DialogueState) as C_DialogueState)

	if dialogue_state == null:
		return

	var dialogue := get_component(C_Dialogue) as C_Dialogue

	if dialogue == null:
		return

	if not dialogue.has_dialogue():
		return

	dialogue_state.start(dialogue.speaker_name, dialogue.lines, source, self)
