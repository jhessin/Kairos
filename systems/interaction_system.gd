class_name InteractionSystem
extends System


func deps() -> Dictionary[int, Array]:
	return {
		Runs.After: [InteractionInputSystem, GodotInteractionSystem, GodotInteractionPromptSystem]
	}


func query() -> QueryBuilder:
	return q.with_all([C_Player, C_Interaction, C_InteractionTarget, C_InteractionRequest])


func process(entities: Array[Entity], _components: Array, _delta: float) -> void:
	for entity in entities:
		var player := entity.get_component(C_Player) as C_Player
		var interaction := entity.get_component(C_Interaction) as C_Interaction
		var target := entity.get_component(C_InteractionTarget) as C_InteractionTarget
		var request := entity.get_component(C_InteractionRequest) as C_InteractionRequest

		if not player.is_local:
			continue

		request.requested = false
		request.source = null
		request.target = null

		if not interaction.interact_pressed:
			continue

		if not target.is_valid:
			continue

		if interaction.target == null:
			continue

		var interactable := (interaction.target.get_component(C_Interactable) as C_Interactable)

		if interactable == null:
			continue

		if not interactable.enabled:
			continue

		request.source = entity
		request.target = interaction.target
		request.requested = true
