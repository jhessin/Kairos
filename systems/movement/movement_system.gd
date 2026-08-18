class_name MovementSystem
extends System


# Remember: Systems contain the meat and potatos of everything and can delete
# themselves or add other systems etc. System order matters.
func query() -> QueryBuilder:
	# process_empty = false # Do we want this to run every frame even with no entities?
	return q.with_all([CMovement, CTransform])


func process(entities: Array[Entity], _components: Array, delta: float) -> void:
	for entity in entities:
		var movement: CMovement = entity.get_component(CMovement)
		var transform: CTransform = entity.get_component(CTransform)
		var player_input: CPlayerInput = entity.get_component(CPlayerInput)
		var player: PlayerEntity = entity as PlayerEntity

		if not movement or not transform:
			return

		if player_input and player:
			player.body.velocity = Vector3(
				player_input.move_vector.x,
				0,
				player_input.move_vector.y,
			).normalized() * movement.speed

		transform.position += (movement.direction * movement.speed * delta)
