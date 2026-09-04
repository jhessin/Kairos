@tool
class_name NPCEntity
extends Entity

@export var dialogue_data: DialogueData
@export var start_id: StringName

@export_category('Objectives')
@export var objectives: Array[Objective] = []


func define_components() -> Array:
	var interactable := C_Interactable.new()

	interactable.interaction_name = 'talk'
	interactable.enabled = true

	var behavior := C_InteractionBehavior.new()
	behavior.callback = _on_interact

	var objective_target := C_ObjectiveTarget.new()
	objective_target.objectives = objectives

	return [interactable, behavior, objective_target]


func _on_interact(player: Entity) -> void:
	var dialogue_state := (player.get_component(C_DialogueState) as C_DialogueState)

	if dialogue_data == null:
		return

	dialogue_state.setup(player, self, dialogue_data, start_id)
