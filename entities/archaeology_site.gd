@tool
class_name ArchaeologySite
extends Entity

@export var artifact_name: String = "Ancient Pottery Fragment"

var completed: bool = false

@onready var visual: MeshInstance3D = $Visual
@onready var artifact: MeshInstance3D = $Artifact
@onready var status_label: Label3D = $StatusLabel


func _ready() -> void:
	add_to_group("interactable")

	if Engine.is_editor_hint():
		return

	_update_visual_state()


func define_components() -> Array:
	return []


func on_ready() -> void:
	_update_visual_state()


func on_update(_delta: float) -> void:
	pass


func on_destroy() -> void:
	pass


func can_interact() -> bool:
	return not completed


func get_interaction_prompt() -> String:
	if completed:
		return ""

	return "E  —  Examine archaeology site"


func interact() -> String:
	if completed:
		return ""

	completed = true
	_update_visual_state()

	return "Artifact recovered: %s" % artifact_name


func _update_visual_state() -> void:
	if not is_instance_valid(artifact):
		return

	if completed:
		artifact.visible = true

		if is_instance_valid(status_label):
			status_label.text = "Artifact recovered"
	else:
		artifact.visible = false

		if is_instance_valid(status_label):
			status_label.text = "Archaeology Site"
