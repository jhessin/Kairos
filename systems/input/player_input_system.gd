class_name PlayerInputSystem
extends System


# Remember: Systems contain the meat and potatos of everything and can delete
# themselves or add other systems etc. System order matters.
func query() -> QueryBuilder:
	# process_empty = false # Do we want this to run every frame even with no entities?
	return q.with_all([CPlayerInput]) # return the query here


func process(entities: Array[Entity], _components: Array, _delta: float) -> void:
	for entity in entities:
		var player_input: CPlayerInput = entity.get_component(CPlayerInput)
		player_input.move_vector = Input.get_vector(
			'move_left',
			'move_right',
			'move_forward',
			'move_backward',
		)
