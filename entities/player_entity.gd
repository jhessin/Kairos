@tool
class_name PlayerEntity
extends Entity

@onready var character_body: CharacterBody3D = $CharacterBody3D
@onready var camera_rig: Node3D = $CharacterBody3D/CameraRig
@onready var spring_arm: SpringArm3D = $CharacterBody3D/CameraRig/SpringArm3D
@onready var camera: Camera3D = $CharacterBody3D/CameraRig/SpringArm3D/Camera3D


func define_components() -> Array:
	return [
		C_Player.new(),
		C_MovementIntent.new(),
		C_Movement.new(),
		C_GodotCharacterBody.new(),
		C_GroundState.new(),
		C_GodotCamera.new(),
		C_CameraState.new(),
		C_Facing.new(),
		C_Rotation.new(),
	]


# Remember Entities are just containers and glue code
func on_ready() -> void:
	var godot_body := get_component(C_GodotCharacterBody) as C_GodotCharacterBody
	var godot_camera := get_component(C_GodotCamera) as C_GodotCamera

	if godot_body:
		godot_body.body = character_body

	if godot_camera:
		godot_camera.rig = camera_rig
		godot_camera.spring_arm = spring_arm
		godot_camera.camera = camera

	if camera:
		camera.current = true


func on_update(_delta: float) -> void:
	pass


func on_destroy() -> void:
	pass
