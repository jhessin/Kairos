class_name C_QuestRequest
extends Component

enum Type {
	NONE,
	START,
	ADVANCE,
	COMPLETE,
}

var type: Type = Type.NONE
var quest_id: String
var objective_id: String
var amount: int


func _init(
	p_quest_id: String = '',
	p_objective_id: String = '',
	p_amount: int = 0,
	p_type: Type = Type.NONE,
) -> void:
	self.quest_id = p_quest_id
	self.objective_id = p_objective_id
	self.amount = p_amount
	self.type = p_type


func clear() -> void:
	type = Type.NONE
	quest_id = ''
	objective_id = ''
	amount = 0


func from_objective(objective: C_QuestObjective):
	if objective == null:
		return
	request_advance(objective.quest_id, objective.objective_id, objective.amount)


func request_start(p_quest_id: String) -> void:
	type = Type.START
	quest_id = p_quest_id
	objective_id = ''
	amount = 0


func request_advance(p_quest_id: String, p_objective_id: String, p_amount: int = 1) -> void:
	type = Type.ADVANCE
	quest_id = p_quest_id
	objective_id = p_objective_id
	amount = p_amount


func request_complete(p_quest_id: String) -> void:
	type = Type.COMPLETE
	quest_id = p_quest_id
	objective_id = ''
	amount = 0
