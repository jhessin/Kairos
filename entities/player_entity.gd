@tool
class_name PlayerEntity
extends Entity

@onready var character_body: CharacterBody3D = $CharacterBody3D
@onready var visual: Node3D = $CharacterBody3D/Visual
@onready var animation_player: AnimationPlayer = $CharacterBody3D/AnimationPlayer

@onready var camera_rig: Node3D = $CharacterBody3D/CameraRig
@onready var spring_arm: SpringArm3D = $CharacterBody3D/CameraRig/SpringArm3D
@onready var camera: Camera3D = $CharacterBody3D/CameraRig/SpringArm3D/Camera3D

@onready var interaction_area: Area3D = $CharacterBody3D/InteractionArea


func define_components() -> Array:
	return [
		C_Player.new(),
		C_MovementIntent.new(),
		C_Movement.new(),
		C_MovementMode.new(),
		C_MovementConfig.new(),
		C_AnimationState.new(),
		C_GodotCharacterBody.new(),
		C_GodotCamera.new(),
		C_GodotVisual.new(),
		C_GodotAnimation.new(),
		C_GroundState.new(),
		C_CameraState.new(),
		C_Facing.new(),
		C_Rotation.new(),
		C_Interaction.new(),
		C_InteractionTarget.new(),
		C_GodotInteraction.new(),
	]


# Remember Entities are just containers and glue code
func on_ready() -> void:
	var godot_body := get_component(C_GodotCharacterBody) as C_GodotCharacterBody
	var godot_camera := get_component(C_GodotCamera) as C_GodotCamera
	var godot_visual := get_component(C_GodotVisual) as C_GodotVisual
	var godot_animation := get_component(C_GodotAnimation) as C_GodotAnimation
	var godot_interaction := get_component(C_GodotInteraction) as C_GodotInteraction

	if godot_body:
		godot_body.body = character_body

	if godot_camera:
		godot_camera.rig = camera_rig
		godot_camera.spring_arm = spring_arm
		godot_camera.camera = camera

	if godot_visual:
		godot_visual.visual = visual

	if godot_animation:
		godot_animation.animation_player = animation_player

	if godot_interaction:
		godot_interaction.area = interaction_area

	if camera:
		camera.current = true


func on_update(_delta: float) -> void:
	pass


func on_destroy() -> void:
	pass
