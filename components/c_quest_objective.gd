class_name C_QuestObjective
extends Component

var quest_id: StringName = &''
var objective_id: StringName = &''
var amount: int


func _init(p_quest_id: StringName = &'', p_objective_id: StringName = &'', p_amount: int = 1) -> void:
	quest_id = p_quest_id
	objective_id = p_objective_id
	amount = p_amount
