class_name FacingSystem
extends System


func deps() -> Dictionary[int, Array]:
	return { Runs.After: [MovementSystem], Runs.Before: [GodotRotationSystem] }


func query() -> QueryBuilder:
	return q.with_all([C_Facing, C_Rotation])


func process(entities: Array[Entity], _components: Array, delta: float) -> void:
	for entity in entities:
		var facing := entity.get_component(C_Facing) as C_Facing
		var rotation := entity.get_component(C_Rotation) as C_Rotation

		var target_direction := facing.direction
		target_direction.y = 0.0

		if target_direction.length_squared() < 0.001:
			continue

		target_direction = target_direction.normalized()

		var target_yaw := atan2(target_direction.x, target_direction.z)

		var angle_difference_value := angle_difference(rotation.yaw, target_yaw)

		var max_rotation := facing.rotation_speed * delta

		angle_difference_value = clamp(angle_difference_value, -max_rotation, max_rotation)

		rotation.yaw += angle_difference_value
