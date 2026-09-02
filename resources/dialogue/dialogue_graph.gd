class_name DialogueGraph
extends Resource

@export var default_entry_node_id: StringName = &''
@export var nodes: Array[DialogueNode] = []
@export var entry_conditions: Array[DialogueEntryCondition] = []


func get_node(node_id: StringName) -> DialogueNode:
	for node in nodes:
		if node != null and node.id == node_id:
			return node
	return null


func resolve_entry_node(quest_state: C_QuestState) -> StringName:
	var winning_entry: DialogueEntryCondition = null

	for entry in entry_conditions:
		if entry == null:
			continue

		if not entry.matches(quest_state):
			continue

		if winning_entry == null or entry.priority > winning_entry.priority:
			winning_entry = entry

	if winning_entry != null:
		return winning_entry.entry_node_id

	return default_entry_node_id


func validate() -> PackedStringArray:
	var errors := PackedStringArray()
	var known_ids: Dictionary[StringName, bool] = { }

	for node in nodes:
		if node == null:
			errors.append('Dialogue graph contains an empty node.')
			continue

		if node.id.is_empty():
			errors.append('Dialogue node has no ID.')
			continue

		if known_ids.has(node.id):
			errors.append('Duplicate dialogue node ID: %s' % node.id)
			continue

		known_ids[node.id] = true

	if get_node(default_entry_node_id) == null:
		errors.append('Default entry node does not exist: %s' % default_entry_node_id)

	for node in nodes:
		if node == null:
			continue

		if not node.continue_to_node_id.is_empty() and get_node(node.continue_to_node_id) == null:
			errors.append(
				'Node %s continues to missing node %s.' % [node.id, node.continue_to_node_id]
			)

		for choice in node.choices:
			if choice == null:
				errors.append('Node %s has an empty choice.' % node.id)
				continue

			if not choice.next_node_id.is_empty() and get_node(choice.next_node_id) == null:
				errors.append(
					'Choice in %s points to missing node %s.' % [node.id, choice.next_node_id]
				)

			if choice.action == null:
				continue

			match choice.action.type:
				DialogueAction.Type.START_QUEST, DialogueAction.Type.COMPLETE_QUEST:
					if choice.action.quest_id.is_empty():
						errors.append('Choice in %s needs a quest ID.' % node.id)
				DialogueAction.Type.ADVANCE_QUEST:
					if choice.action.quest_id.is_empty() or choice.action.objective_id.is_empty():
						errors.append(
							'Advance choice in %s needs quest and objective IDs.' % node.id
						)

	return errors
