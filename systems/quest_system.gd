class_name QuestSystem
extends System


func query() -> QueryBuilder:
	return q.with_all([C_Player, C_QuestState, C_QuestRequest])


func process(entities: Array[Entity], _components: Array, _delta: float) -> void:
	for entity in entities:
		var player := entity.get_component(C_Player) as C_Player
		var quest_state := entity.get_component(C_QuestState) as C_QuestState
		var request := entity.get_component(C_QuestRequest) as C_QuestRequest

		if not player.is_local:
			continue

		_initialize_quests(quest_state)

		match request.type:
			C_QuestRequest.Type.NONE:
				continue
			C_QuestRequest.Type.START:
				start_quest(quest_state, request.quest_id)
			C_QuestRequest.Type.ADVANCE:
				advance_objective(
					quest_state,
					request.quest_id,
					request.objective_id,
					request.amount,
				)
			C_QuestRequest.Type.COMPLETE:
				complete_quest(quest_state, request.quest_id)

		request.clear()


func prerequisites_met(quest_state: C_QuestState, quest: Quest) -> bool:
	for prerequisite_id in quest.prerequisites:
		if quest_state.get_state(prerequisite_id) != C_QuestState.State.COMPLETE:
			return false

	return true


func start_quest(quest_state: C_QuestState, quest_id: String) -> bool:
	var quest := QuestDatabase.get_quest(quest_id)

	if quest == null:
		return false

	if quest_state.get_state(quest_id) != C_QuestState.State.AVAILABLE:
		return false

	if not prerequisites_met(quest_state, quest):
		return false

	quest_state.set_state(quest_id, C_QuestState.State.ACTIVE)

	for objective in quest.objectives:
		quest_state.set_progress(quest_id, objective.id, 0)

	return true


func advance_objective(
	quest_state: C_QuestState,
	quest_id: String,
	objective_id: String,
	amount: int = 1,
) -> bool:
	if quest_state.get_state(quest_id) != C_QuestState.State.ACTIVE:
		return false

	var quest := QuestDatabase.get_quest(quest_id)

	if quest == null:
		return false

	var objective := _get_objective(quest, objective_id)

	if objective == null:
		return false

	var current := quest_state.get_progress(quest_id, objective_id)

	var progress := mini(current + amount, objective.total_steps)

	quest_state.set_progress(quest_id, objective_id, progress)

	return true


func objectives_complete(quest_state: C_QuestState, quest: Quest) -> bool:
	for objective in quest.objectives:
		var progress := quest_state.get_progress(quest.id, objective.id)

		if progress < objective.total_steps:
			return false
	return true


func complete_quest(quest_state: C_QuestState, quest_id: String) -> bool:
	if quest_state.get_state(quest_id) != C_QuestState.State.ACTIVE:
		return false

	var quest := QuestDatabase.get_quest(quest_id)

	if quest == null:
		return false

	if not objectives_complete(quest_state, quest):
		return false

	quest_state.set_state(quest_id, C_QuestState.State.COMPLETE)

	_unlock_quests(quest_state)

	return true


func advance_objective_for_entity(
	entity: Entity,
	quest_id: String,
	objective_id: String,
	amount: int = 1,
) -> bool:
	var quest_state := entity.get_component(C_QuestState) as C_QuestState

	if quest_state == null:
		return false

	return advance_objective(quest_state, quest_id, objective_id, amount)


func _initialize_quests(quest_state: C_QuestState) -> void:
	if not quest_state.states.is_empty():
		return

	for quest_id in QuestDatabase.quests:
		quest_state.set_state(quest_id, C_QuestState.State.LOCKED)

	quest_state.set_state('Q001', C_QuestState.State.AVAILABLE)


func _get_objective(quest: Quest, objective_id: String) -> QuestObjective:
	for objective in quest.objectives:
		if objective.id == objective_id:
			return objective

	return null


func _unlock_quests(quest_state: C_QuestState) -> void:
	for quest_id in QuestDatabase.quests:
		if quest_state.get_state(quest_id) != C_QuestState.State.LOCKED:
			continue

		var quest := QuestDatabase.get_quest(quest_id)

		if quest == null:
			continue

		if prerequisites_met(quest_state, quest):
			quest_state.set_state(quest_id, C_QuestState.State.AVAILABLE)
