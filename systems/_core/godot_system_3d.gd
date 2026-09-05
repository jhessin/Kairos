class_name GodotSystem3d
extends System


func deps() -> Dictionary[int, Array]:
	return {
		Runs.After: [MovementSystem, FacingSystem, InputSystem],
		Runs.Before: [InteractionSystem],
	}


func sub_systems() -> Array[Array]:
	return [
		[q.with_all([C_Movement, C_GodotCharacterBody, C_GroundState]), GodotMovement3d.process],
		[q.with_all([C_Rotation, C_GodotVisual]), GodotRotation.process],
		[q.with_all([C_CameraState, C_GodotCamera]), GodotCamera.process],
		[
			q.with_all(
				[
					C_Player,
					C_Interaction,
					C_InteractionTarget,
					C_GodotInteraction,
					C_InteractionPrompt,
					C_DialogueState,
				]
			),
			GodotInteraction.process,
		],
		[q.with_all([C_InteractionPrompt, C_GodotInteraction]), GodotInteractionPrompt.process],
	]
