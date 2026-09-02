class_name C_GodotDialogue
extends Component

var panel: Control
var speaker_label: Label
var dialogue_label: Label
var choice_container: Container
var choice_button_scene: PackedScene

var rendered_node_id: StringName
var last_active := false
var buttons: Array[Button] = []
