class_name Q001Quest
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


func start(args: Dictionary = { }) -> void:
	objective_instances.clear()

	for objective in objectives:
		if objective == null:
			continue

		objective_instances.append(ObjectiveInstance.new(objective))
	super.start(args)


func get_current_objective() -> ObjectiveInstance:
	for instance in objective_instances:
		if not instance.completed:
			return instance

	return null


func complete_current_objective() -> void:
	var instance := get_current_objective()

	if instance:
		instance.complete()
