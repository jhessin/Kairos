class_name ObjectiveInstance
extends RefCounted

var definition: Objective
var progress: int = 0
var completed: bool = false


func _init(objective: Objective) -> void:
	definition = objective


func complete() -> void:
	if completed:
		return

	completed = true


func matches(type: Objective.Type) -> bool:
	if definition == null:
		return false

	return definition.type == type
