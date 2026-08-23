@tool
class_name InteractionTestEntity
extends Entity


func define_components() -> Array:
	var interactable := C_Interactable.new()

	interactable.interaction_name = 'interact'
	interactable.enabled = true

	return [interactable]
