class_name QuestStep
extends Resource

@export var _completed: bool = false

@export_multiline var description: String

var completed: bool:
	get:
		return _completed


func complete() -> void:
	_completed = true
