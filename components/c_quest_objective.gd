class_name C_QuestObjective
extends Component

var quest_id: String
var objective_id: String
var amount: int


func _init(p_quest_id: String = "", p_objective_id: String = "", p_amount: int = 1) -> void:
	quest_id = p_quest_id
	objective_id = p_objective_id
	amount = p_amount
