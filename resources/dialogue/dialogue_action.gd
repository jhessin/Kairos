class_name DialogueAction
extends Resource

enum Type {
	NONE,
	START_QUEST,
	ADVANCE_QUEST,
	COMPLETE_QUEST,
}

@export var type: Type
@export var quest_id: StringName
@export var objective_id: StringName

@export_range(1, 99, 1) var amount := 1
