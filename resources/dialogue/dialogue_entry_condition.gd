class_name DialogueEntryCondition
extends Resource

@export var quest_id: StringName = &''
@export var required_state: C_QuestState.State = C_QuestState.State.LOCKED
@export var entry_node_id: StringName = &''

@export var progress_requirement := C_QuestState.TotalProgress.ANY

@export_range(0, 100, 1) var priority: int = 0


func matches(quest_state: C_QuestState) -> bool:
	if quest_state == null:
		return false

	if quest_id.is_empty() or entry_node_id.is_empty():
		return false

	if quest_state.get_state(quest_id) != required_state:
		return false

	if progress_requirement != C_QuestState.TotalProgress.ANY:
		return quest_state.get_total_progress(quest_id) == progress_requirement

	return true
