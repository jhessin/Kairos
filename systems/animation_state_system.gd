class_name AnimationStateSystem
extends System


func deps() -> Dictionary[int, Array]:
	return { Runs.After: [MovementSystem], Runs.Before: [GodotAnimationSystem] }


func query() -> QueryBuilder:
	return q.with_all([C_Movement, C_MovementMode, C_AnimationState])


func process(entities: Array[Entity], _components: Array, _delta: float) -> void:
	for entity in entities:
		var movement := entity.get_component(C_Movement) as C_Movement
		var movement_mode := entity.get_component(C_MovementMode) as C_MovementMode
		var animation_state := entity.get_component(C_AnimationState) as C_AnimationState

		animation_state.previous = animation_state.current

		var horizontal_velocity := Vector3(movement.velocity.x, 0.0, movement.velocity.z)

		if horizontal_velocity.length_squared() < 0.001:
			animation_state.current = C_AnimationState.State.IDLE
			continue

		match movement_mode.current:
			C_MovementMode.Mode.WALK:
				animation_state.current = C_AnimationState.State.WALK
			C_MovementMode.Mode.RUN:
				animation_state.current = C_AnimationState.State.RUN
