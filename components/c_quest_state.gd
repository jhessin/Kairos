class_name C_QuestState
extends Component

enum State {
	LOCKED,
	AVAILABLE,
	ACTIVE,
	COMPLETE,
}

var states: Dictionary[String, State] = { }
var progress: Dictionary[String, Dictionary] = { }


func set_state(quest_id: String, state: State) -> void:
	states[quest_id] = state


func get_state(quest_id: String) -> State:
	return states.get(quest_id, State.LOCKED)


func has_state(quest_id: String, state: State) -> bool:
	return get_state(quest_id) == state


func set_progress(quest_id: String, objective_id: String, amount: int) -> void:
	if not progress.has(quest_id):
		progress[quest_id] = { }

	progress[quest_id][objective_id] = maxi(amount, 0)


func get_progress(quest_id: String, objective_id: String) -> int:
	if not progress.has(quest_id):
		return 0

	return progress[quest_id].get(objective_id, 0)


func clear_progress(quest_id: String) -> void:
	progress.erase(quest_id)
