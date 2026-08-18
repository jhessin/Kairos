class_name PlayerMovement
extends System


# Remember: Systems contain the meat and potatos of everything and can delete
# themselves or add other systems etc. System order matters.
func query() -> QueryBuilder:
	# process_empty = false # Do we want this to run every frame even with no entities?
	return q.with_all([IsPlayer, MoveSpeed]) # return the query here


func process(entities: Array[Entity], _components: Array, delta: float) -> void:
	for entity in entities:
		var player = entity as PlayerEntity
		var move_speed: MoveSpeed = entity.get_component(MoveSpeed)
		if not player or not move_speed:
			return

		var input_vector := Input.get_vector(
			'move_left',
			'move_right',
			'move_forward',
			'move_backward',
		)

		var direction := Vector3(input_vector.x, 0, input_vector.y)

		if direction.length() > 0:
			direction = direction.normalized()

		player.body.velocity.x = direction.x * move_speed.move_speed
		player.body.velocity.z = direction.z * move_speed.move_speed

		if not player.body.is_on_floor():
			player.body.velocity.y -= 20.0 * delta
		else:
			player.body.velocity.y = 0

		player.body.move_and_slide()


# If you want a sub system setup, uncomment this comment out process and query and fill it in
func sub_system():
	return [[ECS.world.query.with_all([]), subsys_a]] # return any sub systems here


func subsys_a(_entity: Entity, _delta: float) -> void:
	pass # code here....
