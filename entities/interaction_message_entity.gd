@tool
class_name InteractionMessageEntity
extends Entity


func define_components() -> Array:
	var interactable := C_Interactable.new()

	interactable.interaction_name = 'inspect'
	interactable.enabled = true

	var behavior := C_InteractionBehavior.new()

	behavior.callback = _on_interact

	return [interactable, behavior]


func _on_interact(source: Entity) -> void:
	print(source.name, " inspected the message.")

	print("Message: Welcome to Kairos.")
