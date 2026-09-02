class_name DialogueSystem
extends System


func deps() -> Dictionary[int, Array]:
	return { Runs.After: [InteractionSystem] }


func query() -> QueryBuilder:
	return q.with_all([C_Player, C_Interaction, C_DialogueState, C_QuestRequest])


func process(entities: Array[Entity], _components: Array, _delta: float) -> void:
	for entity in entities:
		var player := entity.get_component(C_Player) as C_Player
		var interaction := entity.get_component(C_Interaction) as C_Interaction
		var dialogue := entity.get_component(C_DialogueState) as C_DialogueState
		var request := entity.get_component(C_QuestRequest) as C_QuestRequest

		if not player.is_local or not dialogue.active:
			continue

		_process_pending_choice(dialogue, request)

		if not interaction.interact_pressed:
			continue

		if not dialogue.active:
			continue

		if dialogue.has_choice():
			continue

		_advance_linear_node(dialogue)


func _process_pending_choice(dialogue: C_DialogueState, request: C_QuestRequest) -> void:
	var choice := dialogue.consume_pending_choice()

	if choice == null:
		return

	if choice.action != null:
		_queue_action(request, choice.action)

	if choice.next_node_id.is_empty():
		dialogue.close()
		return

	if not dialogue.go_to(choice.next_node_id):
		push_error('Dialogue choice points to a missing node.')


func _advance_linear_node(dialogue: C_DialogueState) -> void:
	var node := dialogue.get_current_node()

	if node == null:
		dialogue.close()
		return

	if node.continue_to_node_id.is_empty():
		dialogue.close()
		return

	if not dialogue.go_to(node.continue_to_node_id):
		push_error('Dialogue node points to a missing continuation node.')
		dialogue.close()


func _queue_action(request: C_QuestRequest, action: DialogueAction) -> void:
	match action.type:
		DialogueAction.Type.NONE:
			pass
		DialogueAction.Type.START_QUEST:
			request.request_start(action.quest_id)
		DialogueAction.Type.ADVANCE_QUEST:
			request.request_advance(action.quest_id, action.objective_id, action.amount)
		DialogueAction.Type.COMPLETE_QUEST:
			request.request_complete(action.quest_id)
