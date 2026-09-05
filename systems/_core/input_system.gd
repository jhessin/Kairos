class_name InputSystem
extends System


func deps() -> Dictionary[int, Array]:
	return { Runs.Before: [MovementModeSystem, MovementSystem, GodotSystem3d, FacingSystem] }


func sub_systems() -> Array[Array]:
	return [
		[
			q.with_all([C_Player, C_MovementIntent, C_MovementMode, C_GodotCamera, C_DialogueState]),
			PlayerInput.process,
		],
		[q.with_all([C_Player, C_CameraState]), CameraInput.process],
		[q.with_all([C_Player, C_Interaction]), InteractionInput.process],
	]
