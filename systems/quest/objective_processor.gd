class_name ObjectiveProcessor
extends RefCounted


static func process(entities: Array[Entity], _components: Array, _delta: float) -> void:
	for entity in entities:
		var objective_target := (entity.get_component(C_ObjectiveTarget) as C_ObjectiveTarget)

		if objective_target == null:
			continue


static func process_event(source: Entity, target: Entity, type: Objective.Type) -> void:
	var objective_target := (target.get_component(C_ObjectiveTarget) as C_ObjectiveTarget)

	if objective_target == null:
		return

	var active_quests := QuestSystem.get_active_quests()

	for quest in active_quests:
		if not quest is ObjectiveQuest:
			continue

		var q001 := quest as ObjectiveQuest

		for instance in q001.objective_instances:
			if instance.completed:
				continue

			if not instance.matches(type):
				continue

			if not _target_has_objective(objective_target, instance.definition):
				continue

			print(
				'Objective completed: ',
				instance.definition.id,
				'source = ',
				source.name,
				' target = ',
				target.name,
			)

			instance.complete()
			q001.objective_completed = q001.is_complete

			if q001.objective_completed:
				print('Quest objectives completed: ', q001.quest_name)


static func _target_has_objective(
	objective_target: C_ObjectiveTarget,
	objective: Objective,
) -> bool:
	for target_objective in objective_target.objectives:
		if target_objective == objective:
			return true

	return false
