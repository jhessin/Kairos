class_name InteractionSystem
extends System


func deps() -> Dictionary[int, Array]:
	return { Runs.After: [GodotSystem3d, GodotSystem2d], Runs.Before: [ObjectiveSystem] }


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
