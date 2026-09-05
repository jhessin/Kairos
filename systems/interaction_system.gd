class_name InteractionSystem
extends System


func deps() -> Dictionary[int, Array]:
  return { Runs.After: [InputSystem, GodotSystem3d], Runs.Before: [InteractionBehaviorSystem] }


func query() -> QueryBuilder:
  return q.with_all(
    [C_Player, C_Interaction, C_InteractionTarget, C_InteractionRequest, C_DialogueState]
  )


func process(entities: Array[Entity], _components: Array, _delta: float) -> void:
  for entity in entities:
    var player := entity.get_component(C_Player) as C_Player
    var interaction := entity.get_component(C_Interaction) as C_Interaction
    var target := entity.get_component(C_InteractionTarget) as C_InteractionTarget
    var request := entity.get_component(C_InteractionRequest) as C_InteractionRequest
    var dialogue := entity.get_component(C_DialogueState) as C_DialogueState

    if not player.is_local:
      continue

    request.requested = false
    request.source = null
    request.target = null

    if dialogue.active:
      continue

    if not interaction.interact_pressed:
      continue

    if not target.is_valid:
      continue

    if interaction.target == null:
      continue

    var interactable := (interaction.target.get_component(C_Interactable) as C_Interactable)

    if interactable == null:
      continue

    if not interactable.enabled:
      continue

    request.source = entity
    request.target = interaction.target
    request.requested = true
