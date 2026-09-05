class_name AnimationSystem
extends System


func deps() -> Dictionary[int, Array]:
	return {
		Runs.After: [MovementSystem],
		Runs.Before: [
			GodotSystem3d,
			# GodotSystem2d,
		],
	}


func sub_systems() -> Array[Array]:
	return [
		[q.with_all([C_Facing, C_Rotation]), Facing.process],
		[q.with_all([C_Movement, C_MovementMode, C_AnimationState]), AnimationState.process],
		[q.with_all([C_AnimationState, C_GodotAnimation]), GodotAnimation.process],
	]
