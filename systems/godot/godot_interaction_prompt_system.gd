class_name GodotInteractionPromptSystem
extends System


func deps() -> Dictionary[int, Array]:
	return { Runs.After: [GodotInteractionSystem] }


func query() -> QueryBuilder:
	return q.with_all([C_InteractionPrompt, C_GodotInteraction])


func process(entities: Array[Entity], _components: Array, _delta: float) -> void:
	for entity in entities:
		var prompt := entity.get_component(C_InteractionPrompt) as C_InteractionPrompt
		var godot_interaction := entity.get_component(C_GodotInteraction) as C_GodotInteraction

		var label := godot_interaction.prompt

		if not is_instance_valid(label):
			continue

		label.visible = prompt.visible
		label.text = prompt.text
