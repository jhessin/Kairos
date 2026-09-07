class_name ObjectiveQuest
extends Quest

@export var objectives: Array[Objective] = []

var objective_instances: Array[ObjectiveInstance] = []

var is_complete: bool:
	get:
		if objective_instances.is_empty():
			return false

		for instance in objective_instances:
			if not instance.completed:
				return false

		return true
