class_name Quest
extends RefCounted

var id: String
var title: String
var description: String
var objectives: Array[QuestObjective]
var prerequisites: Array[String]


func _init(
	quest_id: String,
	quest_title: String,
	quest_description: String,
	quest_objectives: Array[QuestObjective] = [],
	quest_prerequisites: Array[String] = [],
) -> void:
	id = quest_id
	title = quest_title
	description = quest_description
	objectives = quest_objectives.duplicate()
	prerequisites = quest_prerequisites.duplicate()
