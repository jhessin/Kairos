@tool
class_name PlayerEntity
extends Entity

@export var quest_001: Quest

@onready var character_body: CharacterBody3D = $CharacterBody3D
@onready var visual: Node3D = $CharacterBody3D/Visual
@onready var animation_player: AnimationPlayer = $CharacterBody3D/AnimationPlayer

@onready var camera_rig: Node3D = $CharacterBody3D/CameraRig
@onready var spring_arm: SpringArm3D = $CharacterBody3D/CameraRig/SpringArm3D
@onready var camera: Camera3D = $CharacterBody3D/CameraRig/SpringArm3D/Camera3D

@onready var interaction_area: Area3D = $CharacterBody3D/InteractionArea

@onready var interaction_prompt: Label = $InteractionUI/InteractionPrompt

@onready var dialogue_box: DialogueBox = %DialogueBox


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
    C_InteractionPrompt.new(),
    C_InteractionRequest.new(),
    C_DialogueState.new(),
    C_GodotDialogue.new(),
  ]


# Remember Entities are just containers and glue code
func on_ready() -> void:
  var godot_body := get_component(C_GodotCharacterBody) as C_GodotCharacterBody
  var godot_camera := get_component(C_GodotCamera) as C_GodotCamera
  var godot_visual := get_component(C_GodotVisual) as C_GodotVisual
  var godot_animation := get_component(C_GodotAnimation) as C_GodotAnimation
  var godot_interaction := get_component(C_GodotInteraction) as C_GodotInteraction
  var godot_dialogue := get_component(C_GodotDialogue) as C_GodotDialogue

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
    godot_interaction.prompt = interaction_prompt

  if godot_dialogue:
    godot_dialogue.box = dialogue_box

    if dialogue_box:
      dialogue_box.visible = false
      dialogue_box.dialogue_ended.connect(_on_dialogue_ended)
      dialogue_box.dialogue_started.connect(_on_dialogue_started)
      dialogue_box.dialogue_signal.connect(_on_dialogue_signal)

  if camera:
    camera.current = true

  if interaction_prompt:
    interaction_prompt.visible = false

  assert(quest_001, 'You forgot to set the quest resource on your player.')


func _on_dialogue_ended() -> void:
  var dialogue_state := get_component(C_DialogueState) as C_DialogueState

  if dialogue_state:
    dialogue_state.close()
    Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _on_dialogue_started(_id: StringName) -> void:
  Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


func _on_dialogue_signal(value: String):
  if value == 'start_q001':
    var quest := QuestSystem.start_quest(quest_001)
    print('Starting quest: ', quest.resource_name)
    print('Active quests: ', QuestSystem.get_active_quests())
