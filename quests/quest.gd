class_name Quest
extends RefCounted

var id: StringName
var title: String
var description: String
var objectives: Array[QuestObjective]
var prerequisites: Array[StringName]


func _init(
	quest_id: StringName,
	quest_title: String,
	quest_description: String,
	quest_objectives: Array[QuestObjective] = [],
	quest_prerequisites: Array[StringName] = [],
) -> void:
	id = quest_id
	title = quest_title
	description = quest_description
	objectives = quest_objectives.duplicate()
	prerequisites = quest_prerequisites.duplicate()
