class_name MovementSystem
extends System


func deps() -> Dictionary[int, Array]:
	return { Runs.After: [PlayerInputSystem], Runs.Before: [GodotMovementSystem] }


# Remember: Systems contain the meat and potatos of everything and can delete
# themselves or add other systems etc. System order matters.
func query() -> QueryBuilder:
	# process_empty = false # Do we want this to run every frame even with no entities?
	return q.with_all([C_MovementIntent, C_Movement, C_GroundState, C_Facing]) # return the query here


func process(entities: Array[Entity], _components: Array, delta: float) -> void:
	for entity in entities:
		var intent := entity.get_component(C_MovementIntent) as C_MovementIntent
		var movement := entity.get_component(C_Movement) as C_Movement
		var ground_state := entity.get_component(C_GroundState) as C_GroundState
		var facing := entity.get_component(C_Facing) as C_Facing

		movement.velocity.x = intent.direction.x * intent.speed
		movement.velocity.z = intent.direction.z * intent.speed

		if intent.direction.length_squared() > 0.001:
			facing.direction = intent.direction.normalized()

		# Apply gravity while the character is not standing on the floor.
		if not ground_state.is_on_floor:
			movement.velocity.y -= movement.gravity * delta
		else:
			# Prevent accumulated downward velocity from building up.
			if movement.velocity.y < 0.0:
				movement.velocity.y = 0.0
