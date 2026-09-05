class_name InteractionInput
extends RefCounted


static func process(entities: Array[Entity], _components: Array, _delta: float) -> void:
	for entity in entities:
		var player := entity.get_component(C_Player) as C_Player
		var interaction := entity.get_component(C_Interaction) as C_Interaction

		if not player.is_local:
			continue

		interaction.interact_pressed = false

		if Input.is_action_just_pressed('ui_accept'):
			interaction.interact_pressed = true
