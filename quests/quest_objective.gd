class_name QuestObjective
extends RefCounted

var id: StringName
var description: String
var total_steps: int


func _init(objective_id: StringName, objective_description: String, objective_total_steps: int = 1) -> void:
	id = objective_id
	description = objective_description
	total_steps = maxi(objective_total_steps, 1)
