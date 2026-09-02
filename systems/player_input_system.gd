class_name PlayerInputSystem
extends System


# Remember: Systems contain the meat and potatos of everything and can delete
# themselves or add other systems etc. System order matters.
func query() -> QueryBuilder:
	# process_empty = false # Do we want this to run every frame even with no entities?
	return q.with_all([C_Player, C_MovementIntent, C_MovementMode, C_GodotCamera, C_DialogueState]) # return the query here


func process(entities: Array[Entity], _components: Array, _delta: float) -> void:
	if Input.is_action_just_pressed('ui_cancel'):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

	for entity in entities:
		var player := entity.get_component(C_Player) as C_Player
		var intent := entity.get_component(C_MovementIntent) as C_MovementIntent
		var movement_mode := entity.get_component(C_MovementMode) as C_MovementMode
		var godot_camera := entity.get_component(C_GodotCamera) as C_GodotCamera
		var dialogue := entity.get_component(C_DialogueState) as C_DialogueState

		if not player.is_local:
			continue

		var camera := godot_camera.camera

		if not is_instance_valid(camera):
			intent.direction = Vector3.ZERO
			continue

		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and not dialogue.active:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

		# Get the user input
		var input_2d := Input.get_vector('move_left', 'move_right', 'move_backward', 'move_forward')

		var camera_forward := -camera.global_transform.basis.z
		var camera_right := camera.global_transform.basis.x

		camera_forward.y = 0.0
		camera_right.y = 0.0

		camera_forward = camera_forward.normalized()
		camera_right = camera_right.normalized()

		var direction := Vector3.ZERO

		if not dialogue.active:
			direction = Vector3(camera_right * input_2d.x + camera_forward * input_2d.y)

		if direction.length_squared() > 1.0:
			direction = direction.normalized()

		intent.direction = direction

		if Input.is_action_pressed('move_run'):
			movement_mode.current = C_MovementMode.Mode.RUN
		else:
			movement_mode.current = C_MovementMode.Mode.WALK
