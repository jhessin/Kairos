class_name Objective
extends Resource

enum Type {
	INTERACT,
	COLLECT,
	KILL,
	DIALOGUE,
}

@export var id: StringName
@export var type := Type.INTERACT

@export_multiline var description: String
