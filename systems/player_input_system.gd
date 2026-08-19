class_name PlayerInputSystem
extends System


# Remember: Systems contain the meat and potatos of everything and can delete
# themselves or add other systems etc. System order matters.
func query() -> QueryBuilder:
	# process_empty = false # Do we want this to run every frame even with no entities?
	return q.with_all([C_Player, C_MovementIntent]) # return the query here


func process(entities: Array[Entity], _components: Array, _delta: float) -> void:
	for entity in entities:
		var player := entity.get_component(C_Player) as C_Player
		var intent := entity.get_component(C_MovementIntent) as C_MovementIntent

		if not player.is_local:
			continue

		var input_2d := Input.get_vector('move_left', 'move_right', 'move_forward', 'move_backward')

		var direction := Vector3(input_2d.x, 0.0, input_2d.y)

		if direction.length_squared() > 1.0:
			direction = direction.normalized()

		intent.direction = direction
