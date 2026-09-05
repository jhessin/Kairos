class_name MovementMode
extends RefCounted


static func process(entities: Array[Entity], _components: Array, _delta: float) -> void:
	for entity in entities:
		var movement_mode := (entity.get_component(C_MovementMode) as C_MovementMode)

		var movement_config := (entity.get_component(C_MovementConfig) as C_MovementConfig)

		var intent := (entity.get_component(C_MovementIntent) as C_MovementIntent)

		match movement_mode.current:
			C_MovementMode.Mode.WALK:
				intent.speed = movement_config.walk_speed

			C_MovementMode.Mode.RUN:
				intent.speed = movement_config.run_speed
