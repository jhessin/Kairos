class_name GodotInteraction
extends RefCounted


static func process(entities: Array[Entity], _components: Array, _delta: float) -> void:
	for entity in entities:
		var player := entity.get_component(C_Player) as C_Player
		var interaction := entity.get_component(C_Interaction) as C_Interaction
		var target := entity.get_component(C_InteractionTarget) as C_InteractionTarget
		var godot_interaction := entity.get_component(C_GodotInteraction) as C_GodotInteraction
		var prompt := entity.get_component(C_InteractionPrompt) as C_InteractionPrompt
		var dialogue := entity.get_component(C_DialogueState) as C_DialogueState

		if not player.is_local:
			continue

		if dialogue.active:
			target.is_valid = false
			target.entity = null
			interaction.target = null

			prompt.visible = false
			prompt.target = null
			prompt.text = ""

			continue

		if not is_instance_valid(godot_interaction.area):
			continue

		var bodies := godot_interaction.area.get_overlapping_bodies()

		var closest_entity: Entity
		var closest_distance := INF

		for body in bodies:
			var possible_entity := _find_entity(body)

			if possible_entity == null:
				continue

			var interactable := (possible_entity.get_component(C_Interactable) as C_Interactable)

			if interactable == null:
				continue

			if not interactable.enabled:
				continue

			var distance := body.global_position.distance_to(godot_interaction.area.global_position)

			if distance > interaction.interaction_range:
				continue

			if distance < closest_distance:
				closest_distance = distance
				closest_entity = possible_entity

		if closest_entity != null:
			var interactable := (closest_entity.get_component(C_Interactable) as C_Interactable)

			target.is_valid = true
			target.entity = closest_entity
			interaction.target = closest_entity

			prompt.visible = true
			prompt.target = closest_entity
			prompt.text = "Press E to " + interactable.interaction_name
		else:
			target.is_valid = false
			target.entity = null

			interaction.target = null

			prompt.visible = false
			prompt.target = null
			prompt.text = ""


static func _find_entity(node: Node) -> Entity:
	var current := node

	while current != null:
		if current is Entity:
			return current

		current = current.get_parent()

	return null
