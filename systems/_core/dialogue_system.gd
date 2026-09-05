class_name DialogueSystem
extends System


func deps() -> Dictionary[int, Array]:
	return { Runs.After: [InteractionSystem] }


func sub_systems() -> Array[Array]:
	return [[q.with_all([C_Player, C_DialogueState, C_GodotDialogue]), GodotDialogue.process]]
