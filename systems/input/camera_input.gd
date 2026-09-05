class_name CameraInput
extends RefCounted


static func process(entities: Array[Entity], _components: Array, delta: float) -> void:
	for entity in entities:
		var player := entity.get_component(C_Player) as C_Player
		var camera_state := entity.get_component(C_CameraState) as C_CameraState

		if not player.is_local:
			continue

		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			var mouse_velocity := Input.get_last_mouse_velocity()

			camera_state.yaw -= (mouse_velocity.x * camera_state.mouse_sensitivity)
			camera_state.pitch -= (mouse_velocity.y * camera_state.mouse_sensitivity)

		var camera_input := Input.get_vector(
			'camera_left',
			'camera_right',
			'camera_up',
			'camera_down',
		)

		camera_state.yaw -= (camera_input.x * camera_state.controller_sensitivity * delta)
		camera_state.pitch -= (camera_input.y * camera_state.controller_sensitivity * delta)

		if Input.is_action_just_pressed('camera_zoom_in'):
			camera_state.distance -= 0.5

		if Input.is_action_just_pressed('camera_zoom_out'):
			camera_state.distance += 0.5

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
