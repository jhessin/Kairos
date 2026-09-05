class_name InteractionSystem
extends System


func deps() -> Dictionary[int, Array]:
	return { Runs.After: [InputSystem, GodotSystem3d], Runs.Before: [InteractionBehaviorSystem] }


func sub_systems() -> Array[Array]:
	return [
		[
			q.with_all(
				[
					C_Player,
					C_Interaction,
					C_InteractionTarget,
					C_InteractionRequest,
					C_DialogueState,
				]
			),
			Interaction.process,
		],
		[q.with_all([C_InteractionBehavior]), InteractionBehavior.process],
	]
