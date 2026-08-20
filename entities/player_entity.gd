@tool
class_name PlayerEntity
extends Entity

@onready var character_body: CharacterBody3D = $CharacterBody3D
@onready var camera: Camera3D = $CharacterBody3D/Camera3D


func define_components() -> Array:
	return [
		C_Player.new(),
		C_MovementIntent.new(),
		C_Movement.new(),
		C_GodotCharacterBody.new(),
		C_GroundState.new(),
		C_GodotCamera.new(),
	]


# Remember Entities are just containers and glue code
func on_ready() -> void:
	var godot_body := get_component(C_GodotCharacterBody) as C_GodotCharacterBody
	var godot_camera := get_component(C_GodotCamera) as C_GodotCamera

	if godot_body:
		godot_body.body = character_body

	if godot_camera:
		godot_camera.camera = camera

	if camera:
		camera.current = true


func on_update(_delta: float) -> void:
	pass


func on_destroy() -> void:
	pass
