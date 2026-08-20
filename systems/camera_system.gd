class_name CameraSystem
extends System


func query() -> QueryBuilder:
	return q.with_all([C_Player, C_CameraState])


func process(entities: Array[Entity], _components: Array, _delta: float) -> void:
	for entity in entities:
		var player := entity.get_component(C_Player) as C_Player
		var camera_state := entity.get_component(C_CameraState) as C_CameraState

		if not player.is_local:
			continue

		# Only act if the mouse is captured
		if Input.mouse_mode != Input.MOUSE_MODE_CAPTURED:
			continue

		# Get the input from the user.
		var mouse_velocity := Input.get_last_mouse_velocity()

		if Input.is_action_just_pressed('camera_zoom_in'):
			camera_state.distance -= 0.5

		if Input.is_action_just_pressed('camera_zoom_out'):
			camera_state.distance += 0.5

		# Set the input of the ECS component
		camera_state.yaw -= mouse_velocity.x * camera_state.sensitivity
		camera_state.pitch -= mouse_velocity.y * camera_state.sensitivity

		# Clamp values appropriately
		camera_state.pitch = clamp(
			camera_state.pitch,
			camera_state.min_pitch,
			camera_state.max_pitch,
		)
		camera_state.distance = clamp(
			camera_state.distance,
			camera_state.min_distance,
			camera_state.max_distance,
		)
