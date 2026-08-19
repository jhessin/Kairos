class_name MovementSystem
extends System


func deps() -> Dictionary[int, Array]:
	return { Runs.After: [PlayerInputSystem], Runs.Before: [GodotMovementSystem] }


# Remember: Systems contain the meat and potatos of everything and can delete
# themselves or add other systems etc. System order matters.
func query() -> QueryBuilder:
	# process_empty = false # Do we want this to run every frame even with no entities?
	return q.with_all([C_MovementIntent, C_Movement]) # return the query here


func process(entities: Array[Entity], _components: Array, delta: float) -> void:
	for entity in entities:
		var intent := entity.get_component(C_MovementIntent) as C_MovementIntent
		var movement := entity.get_component(C_Movement) as C_Movement

		movement.velocity.x = intent.direction.x * intent.speed
		movement.velocity.z = intent.direction.z * intent.speed

		# Apply gravity while the character is not standing on the floor.
		var godot_body := entity.get_component(C_GodotCharacterBody) as C_GodotCharacterBody

		if godot_body and is_instance_valid(godot_body.body):
			if not godot_body.body.is_on_floor():
				movement.velocity.y -= movement.gravity * delta
			else:
				# Prevent accumulated downward velocity from building up.
				if movement.velocity.y < 0.0:
					movement.velocity.y = 0.0
