class_name GodotRotationSystem
extends System


func deps() -> Dictionary[int, Array]:
	return { Runs.After: [FacingSystem], Runs.Before: [GodotMovementSystem] }


func query() -> QueryBuilder:
	return q.with_all([C_Rotation, C_GodotCharacterBody])


func process(entities: Array[Entity], _components: Array, _delta: float) -> void:
	for entity in entities:
		var rotation := entity.get_component(C_Rotation) as C_Rotation
		var godot_body := entity.get_component(C_GodotCharacterBody) as C_GodotCharacterBody

		var body := godot_body.body

		if not is_instance_valid(body):
			continue

		body.rotation.y = rotation.yaw
