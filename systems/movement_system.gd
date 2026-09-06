class_name MovementSystem
extends System


func deps() -> Dictionary[int, Array]:
  return { Runs.After: [InputSystem], Runs.Before: [AnimationSystem] }


func sub_systems() -> Array[Array]:
  return [
    [q.with_all([C_MovementMode, C_MovementConfig, C_MovementIntent]), MovementMode.process],
    [q.with_all([C_MovementIntent, C_Movement, C_GroundState, C_Facing]), Movement.process],
  ]
