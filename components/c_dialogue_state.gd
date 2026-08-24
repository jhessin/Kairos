class_name C_DialogueState
extends Component

var active: bool = false
var speaker_name: String = ''
var lines: Array[String] = []
var current_line: int = 0
var source: Entity = null
var target: Entity = null


func start(
	dialogue_speaker: String,
	dialogue_lines: Array[String],
	dialogue_source: Entity,
	dialogue_target: Entity,
) -> void:
	speaker_name = dialogue_speaker
	lines = dialogue_lines.duplicate()
	current_line = 0
	source = dialogue_source
	target = dialogue_target
	active = not lines.is_empty()


func close() -> void:
	active = false
	speaker_name = ''
	lines.clear()
	current_line = 0
	source = null
	target = null


func get_current_line() -> String:
	if not active:
		return ''

	if current_line < 0:
		return ''

	if current_line >= lines.size():
		return ''

	return lines[current_line]


func advance() -> void:
	if not active:
		return

	current_line += 1

	if current_line >= lines.size():
		close()
