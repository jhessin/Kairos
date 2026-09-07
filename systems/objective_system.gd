class_name ObjectiveSystem
extends System


static func _on_interacted(source: Entity, target: Entity) -> void:
	ObjectiveProcessor.process_event(source, target, Objective.Type.INTERACT)


static func _on_collected(source: Entity, target: Entity) -> void:
	ObjectiveProcessor.process_event(source, target, Objective.Type.COLLECT)


static func _on_killed(source: Entity, target: Entity) -> void:
	ObjectiveProcessor.process_event(source, target, Objective.Type.KILL)


func _ready() -> void:
	GameEventBus.interacted.connect(_on_interacted)
	GameEventBus.collected.connect(_on_collected)
	GameEventBus.killed.connect(_on_killed)
	GameEventBus.start_quest.connect(QuestProcessor.start_quest)
	GameEventBus.complete_quest.connect(QuestProcessor.complete_quest)


func deps() -> Dictionary[int, Array]:
	return { Runs.After: [InteractionSystem], Runs.Before: [DialogueSystem] }


func sub_systems() -> Array[Array]:
	return [[q.with_all([C_ObjectiveTarget]), ObjectiveProcessor.process]]
