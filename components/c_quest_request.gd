class_name C_QuestRequest
extends Component

var quest_id: String
var objective_id: String
var amount: int


func _init(objective: C_QuestObjective = null) -> void:
  if objective == null:
    clear()
    return
  quest_id = objective.quest_id
  objective_id = objective.objective_id
  amount = objective.amount


func clear() -> void:
  quest_id = ''
  objective_id = ''
  amount = 0
