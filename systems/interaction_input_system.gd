class_name InteractionInputSystem
extends System


func query() -> QueryBuilder:
	return q.with_all([C_Player, C_Interaction])


func process(entities: Array[Entity], components: Array, delta: float) -> void:
	for entity in entities:
		var player := entity.get_component(C_Player) as C_Player
		var interaction := entity.get_component(C_Interaction) as C_Interaction

		if not player.is_local:
			continue

		interaction.interact_pressed = Input.is_action_just_pressed('interact')
