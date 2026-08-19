class_name GodotMovementSystem
extends System


func deps() -> Dictionary[int, Array]:
	return { Runs.After: [MovementSystem] }


# Remember: Systems contain the meat and potatos of everything and can delete
# themselves or add other systems etc. System order matters.
func query() -> QueryBuilder:
	# process_empty = false # Do we want this to run every frame even with no entities?
	return q.with_all([C_Movement, C_GodotCharacterBody]) # return the query here


func process(entities: Array[Entity], _components: Array, _delta: float) -> void:
	for entity in entities:
		var movement := entity.get_component(C_Movement) as C_Movement
		var godot_body := entity.get_component(C_GodotCharacterBody) as C_GodotCharacterBody

		var body := godot_body.body

		if not is_instance_valid(body):
			continue

		body.velocity = movement.velocity

		body.move_and_slide()

		movement.velocity = body.velocity
