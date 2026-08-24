class_name GodotDialogueSystem
extends System


func deps() -> Dictionary[int, Array]:
	return { Runs.After: [DialogueSystem] }


func query() -> QueryBuilder:
	return q.with_all([C_Player, C_DialogueState, C_GodotDialogue])


func process(entities: Array[Entity], _components: Array, _delta: float) -> void:
	for entity in entities:
		var player := entity.get_component(C_Player) as C_Player
		var dialogue := entity.get_component(C_DialogueState) as C_DialogueState
		var godot_dialogue := entity.get_component(C_GodotDialogue) as C_GodotDialogue

		if not player.is_local:
			continue

		if not is_instance_valid(godot_dialogue.panel):
			continue

		godot_dialogue.panel.visible = dialogue.active

		if not dialogue.active:
			continue

		if is_instance_valid(godot_dialogue.speaker_label):
			godot_dialogue.speaker_label.text = dialogue.speaker_name

		if is_instance_valid(godot_dialogue.dialogue_label):
			godot_dialogue.dialogue_label.text = dialogue.get_current_line()
