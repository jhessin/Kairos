class_name InteractionSystem
extends System


func query() -> QueryBuilder:
	return q.with_all([C_Player, C_Interaction, C_GodotCamera, C_GodotInteraction])


func process(entities: Array[Entity], _components: Array, delta: float) -> void:
	for entity in entities:
		var player := entity.get_component(C_Player) as C_Player
		var interaction := entity.get_component(C_Interaction) as C_Interaction
		var godot_camera := entity.get_component(C_GodotCamera) as C_GodotCamera
		var godot_interaction := entity.get_component(C_GodotInteraction) as C_GodotInteraction

		if not player.is_local:
			continue

		var camera := godot_camera.camera

		if not is_instance_valid(camera):
			continue

		if interaction.message_time > 0.0:
			interaction.message_time -= delta

			if is_instance_valid(godot_interaction.prompt_label):
				godot_interaction.prompt_label.text = interaction.message
				godot_interaction.prompt_label.visible = true

			continue

		var best_target: Node
		var best_distance := interaction.interaction_range

		for candidate in get_tree().get_nodes_in_group('interactable'):
			if not is_instance_valid(candidate):
				continue

			if not candidate.has_method('can_interact'):
				continue

			if not candidate.can_interact():
				continue

			var distance: float = camera.get_parent().get_parent().global_position.distance_to(
				candidate.global_position
			)

			if distance > best_distance:
				continue

			var to_target: Vector3 = (candidate.global_position - camera.global_position).normalized()

			var forward := -camera.global_transform.basis.z

			if forward.dot(to_target) < 0.55:
				continue

			best_target = candidate
			best_distance = distance

		interaction.target = best_target

		if is_instance_valid(godot_interaction.prompt_label):
			if is_instance_valid(best_target):
				interaction.prompt = best_target.get_interaction_prompt()
				godot_interaction.prompt_label.text = interaction.prompt
				godot_interaction.prompt_label.visible = interaction.prompt != ""
			else:
				interaction.prompt = ""
				godot_interaction.prompt_label.text = ''
				godot_interaction.prompt_label.visible = false

		if Input.is_action_just_pressed('interact') and is_instance_valid(best_target):
			if best_target.has_method('interact'):
				interaction.message = best_target.interact()
				interaction.message_time = 2.5

				if is_instance_valid(godot_interaction.prompt_label):
					godot_interaction.prompt_label.text = interaction.message
					godot_interaction.prompt_label.visible = interaction.message != ''
