class_name GodotDialogue
extends RefCounted


static func process(entities: Array[Entity], _components: Array, _delta: float) -> void:
	for entity in entities:
		var player := entity.get_component(C_Player) as C_Player
		var dialogue := entity.get_component(C_DialogueState) as C_DialogueState
		var godot_dialogue := entity.get_component(C_GodotDialogue) as C_GodotDialogue

		if not player.is_local:
			continue

		if not is_instance_valid(godot_dialogue.box):
			continue

		godot_dialogue.box.visible = dialogue.active

		if not dialogue.active:
			continue

		if dialogue.data == null or dialogue.start_node.is_empty():
			continue

		godot_dialogue.box.data = dialogue.data

		if godot_dialogue.box.is_running():
			continue

		godot_dialogue.box.start(dialogue.start_node)
