class_name PlayerPresentationSystem
extends System


# Remember: Systems contain the meat and potatos of everything and can delete
# themselves or add other systems etc. System order matters.
func query() -> QueryBuilder:
	# process_empty = false # Do we want this to run every frame even with no entities?
	return q.with_all([CPlayer]) # return the query here


func process(entities: Array[Entity], _components: Array, _delta: float) -> void:
	for entity in entities:
		var player: PlayerEntity = entity as PlayerEntity
		if not player:
			return

		player.body.move_and_slide()
