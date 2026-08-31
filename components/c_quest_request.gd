class_name C_QuestRequest
extends Component

var quest_id: String
var objective_id: String
var amount: int


func _init(p_quest_id: String = '', p_objective_id: String = '', p_amount: int = 0) -> void:
  self.quest_id = p_quest_id
  self.objective_id = p_objective_id
  self.amount = p_amount


func clear() -> void:
  quest_id = ''
  objective_id = ''
  amount = 0

func from_objective(objective: C_QuestObjective):
  if objective == null:
    return
  quest_id = objective.quest_id
  objective_id = objective.objective_id
  amount = objective.amount
