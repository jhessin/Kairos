class_name GodotMovement3d
extends RefCounted


static func process(entities: Array[Entity], _components: Array, _delta: float) -> void:
	for entity in entities:
		var movement := entity.get_component(C_Movement) as C_Movement
		var godot_body := entity.get_component(C_GodotCharacterBody) as C_GodotCharacterBody
		var ground_state := entity.get_component(C_GroundState) as C_GroundState

		var body := godot_body.body

		if not is_instance_valid(body):
			continue

		body.velocity = movement.velocity

		body.move_and_slide()

		movement.velocity = body.velocity
		ground_state.is_on_floor = body.is_on_floor()
