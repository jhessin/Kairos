class_name Q001Quest
extends Quest

@export var steps: Array[Objective] = []

var is_complete: bool:
	get:
		return get_current_step() == null


func get_current_step() -> Objective:
	for step in steps:
		if not step.completed:
			return step

	return null


func complete_current_step() -> void:
	var step := get_current_step()

	if step:
		step.complete()
