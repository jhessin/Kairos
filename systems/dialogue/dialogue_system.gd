class_name DialogueSystem
extends System


func deps() -> Dictionary[int, Array]:
	return { Runs.After: [InteractionSystem] }


func query() -> QueryBuilder:
	return q.with_all([C_Player, C_Interaction, C_DialogueState])


func process(_entities: Array[Entity], _components: Array, _delta: float) -> void:
	pass
	# for entity in entities:
	# 	var player := entity.get_component(C_Player) as C_Player
	# 	var interaction := entity.get_component(C_Interaction) as C_Interaction
	# 	var dialogue := entity.get_component(C_DialogueState) as C_DialogueState
	#
	# 	if not player.is_local:
	# 		continue
	#
	# 	if not interaction.interact_pressed:
	# 		continue
	#
	# 	if not dialogue.active:
	# 		continue
	#
	# 	dialogue.advance()
