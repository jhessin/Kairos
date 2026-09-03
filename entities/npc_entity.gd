@tool
class_name NPCEntity
extends Entity

@export var dialogue_data: DialogueData
@export var start_id: StringName


func define_components() -> Array:
	var interactable := C_Interactable.new()

	interactable.interaction_name = 'talk'
	interactable.enabled = true

	var behavior := C_InteractionBehavior.new()
	behavior.callback = _on_interact

	return [interactable, behavior]


func _on_interact(player: Entity) -> void:
	var dialogue_state := (player.get_component(C_DialogueState) as C_DialogueState)

	if dialogue_data == null:
		return

	dialogue_state.setup(player, self, dialogue_data, start_id)
