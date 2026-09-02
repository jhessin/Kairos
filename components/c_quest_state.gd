class_name C_QuestState
extends Component

enum State {
	LOCKED,
	AVAILABLE,
	ACTIVE,
	COMPLETE,
}

enum TotalProgress {
	ANY,
	NOT_STARTED,
	IN_PROGRESS,
	ALL_OBJECTIVES_COMPLETED,
	QUEST_COMPLETED,
}

var states: Dictionary[StringName, State] = { }
var progress: Dictionary[StringName, Dictionary] = { }


func set_state(quest_id: StringName, state: State) -> void:
	states[quest_id] = state


func get_state(quest_id: StringName) -> State:
	return states.get(quest_id, State.LOCKED)


func has_state(quest_id: StringName, state: State) -> bool:
	return get_state(quest_id) == state


func set_progress(quest_id: StringName, objective_id: StringName, amount: int) -> void:
	if not progress.has(quest_id):
		progress[quest_id] = { }

	progress[quest_id][objective_id] = maxi(amount, 0)


func get_progress(quest_id: StringName, objective_id: StringName) -> int:
	if not progress.has(quest_id):
		return 0

	return progress[quest_id].get(objective_id, 0)


func clear_progress(quest_id: StringName) -> void:
	progress.erase(quest_id)


func get_total_progress(quest_id: StringName) -> TotalProgress:
	match get_state(quest_id):
		State.LOCKED, State.AVAILABLE:
			return TotalProgress.NOT_STARTED
		State.ACTIVE:
			for objective in QuestDatabase.get_quest(quest_id).objectives:
				if get_progress(quest_id, objective.id) < objective.total_steps:
					return TotalProgress.IN_PROGRESS
			return TotalProgress.ALL_OBJECTIVES_COMPLETED
		State.COMPLETE:
			return TotalProgress.QUEST_COMPLETED
	return TotalProgress.NOT_STARTED
