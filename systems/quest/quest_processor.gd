class_name QuestProcessor
extends RefCounted


static func process(entities: Array[Entity], _components: Array, _delta: float) -> void:
	for entity in entities:
		var objective_target := (entity.get_component(C_ObjectiveTarget) as C_ObjectiveTarget)

		if objective_target == null:
			continue


static func start_quest(_player: PlayerEntity, _quest: ObjectiveQuest) -> void:
	# TODO
	pass


static func complete_quest(_player: PlayerEntity, _quest: ObjectiveQuest) -> void:
	# TODO
	pass


static func _target_has_objective(
	objective_target: C_ObjectiveTarget,
	objective: Objective,
) -> bool:
	for target_objective in objective_target.objectives:
		if target_objective == objective:
			return true

	return false
