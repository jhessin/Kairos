class_name ObjectiveSystem
extends System


func _ready() -> void:
	GameEventBus.interacted.connect(_on_interacted)
	GameEventBus.collected.connect(_on_collected)
	GameEventBus.killed.connect(_on_killed)


func deps() -> Dictionary[int, Array]:
	return { Runs.After: [InteractionBehaviorSystem] }


func query() -> QueryBuilder:
	return q.with_all([C_ObjectiveTarget])


func process(entities: Array[Entity], _components: Array, _delta: float) -> void:
	for entity in entities:
		var objective_target := (entity.get_component(C_ObjectiveTarget) as C_ObjectiveTarget)

		if objective_target == null:
			continue


func _on_interacted(source: Entity, target: Entity) -> void:
	_process_event(source, target, Objective.Type.INTERACT)


func _on_collected(source: Entity, target: Entity) -> void:
	_process_event(source, target, Objective.Type.COLLECT)


func _on_killed(source: Entity, target: Entity) -> void:
	_process_event(source, target, Objective.Type.KILL)


func _process_event(source: Entity, target: Entity, type: Objective.Type) -> void:
	var objective_target := (target.get_component(C_ObjectiveTarget) as C_ObjectiveTarget)

	if objective_target == null:
		return

	var active_quests := QuestSystem.get_active_quests()

	for quest in active_quests:
		if not quest is Q001Quest:
			continue

		var q001 := quest as Q001Quest

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


func _target_has_objective(objective_target: C_ObjectiveTarget, objective: Objective) -> bool:
	for target_objective in objective_target.objectives:
		if target_objective == objective:
			return true

	return false
