class_name QuestDebugPanel
extends PanelContainer

var quest_state: C_QuestState

var _title: Label
var _content: VBoxContainer


func _ready() -> void:
	_build_ui()


func _process(_delta: float) -> void:
	if quest_state == null:
		return

	_refresh()


func set_quest_state(p_quest_state: C_QuestState) -> void:
	quest_state = p_quest_state
	_refresh()


func set_player(entity: Entity) -> void:
	quest_state = entity.get_component(C_QuestState) as C_QuestState

	_refresh()


func _build_ui() -> void:
	custom_minimum_size = Vector2(360.0, 0.0)

	var margin := MarginContainer.new()
	margin.add_theme_constant_override("margin_left", 12)
	margin.add_theme_constant_override("margin_top", 10)
	margin.add_theme_constant_override("margin_right", 12)
	margin.add_theme_constant_override("margin_bottom", 10)

	add_child(margin)

	var container := VBoxContainer.new()
	margin.add_child(container)

	_title = Label.new()
	_title.text = "QUEST DEBUG"
	_title.add_theme_font_size_override("font_size", 18)

	container.add_child(_title)

	var separator := HSeparator.new()
	container.add_child(separator)

	_content = VBoxContainer.new()
	_content.add_theme_constant_override("separation", 8)

	container.add_child(_content)


func _refresh() -> void:
	if _content == null:
		print('quest_debug_ui: refresh being called before _build_ui')
		return

	for child in _content.get_children():
		child.queue_free()

	if quest_state == null:
		var label := Label.new()
		label.text = "Waiting for player quest state..."
		_content.add_child(label)
		return

	for quest_id in QuestDatabase.quests:
		_add_quest(quest_id)


func _add_quest(quest_id: StringName) -> void:
	var quest := QuestDatabase.get_quest(quest_id)

	if quest == null:
		return

	var state := quest_state.get_state(quest_id)

	var quest_label := Label.new()
	quest_label.text = "%s  %s\n%s" % [quest_id, _state_name(state), quest.title]

	_content.add_child(quest_label)

	if state != C_QuestState.State.ACTIVE \
			and state != C_QuestState.State.COMPLETE:
		return

	for objective in quest.objectives:
		var progress := quest_state.get_progress(quest_id, objective.id)

		var objective_label := Label.new()
		objective_label.text = "    %s\n    %d / %d" % [
			objective.description,
			progress,
			objective.total_steps,
		]

		_content.add_child(objective_label)


func _state_name(state: C_QuestState.State) -> String:
	match state:
		C_QuestState.State.LOCKED:
			return "LOCKED"

		C_QuestState.State.AVAILABLE:
			return "AVAILABLE"

		C_QuestState.State.ACTIVE:
			return "ACTIVE"

		C_QuestState.State.COMPLETE:
			return "COMPLETE"

	return "UNKNOWN"
