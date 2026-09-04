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

	for objective in objective_target.objectives:
		if objective == null:
			continue

		if objective.type != type:
			continue

		print("Objective event: ", objective.id, " source=", source.name, " target=", target.name)
