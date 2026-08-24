@tool
class_name DoorEntity
extends Entity

var is_open: bool = false


func define_components() -> Array:
	var interactable := C_Interactable.new()

	interactable.interaction_name = 'open'
	interactable.enabled = true

	var behavior := C_InteractionBehavior.new()
	behavior.callback = _on_interact

	return [interactable, behavior]


func _on_interact(_source: Entity) -> void:
	is_open = not is_open
	var interactable := get_component(C_Interactable) as C_Interactable

	if is_open:
		print("Door opened.")
		interactable.interaction_name = 'close'
	else:
		print("Door closed.")
		interactable.interaction_name = 'open'
