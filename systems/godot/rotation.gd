class_name GodotRotation
extends RefCounted


static func process(entities: Array[Entity], _components: Array, _delta: float) -> void:
	for entity in entities:
		var rotation := entity.get_component(C_Rotation) as C_Rotation
		var godot_visual := entity.get_component(C_GodotVisual) as C_GodotVisual

		if not is_instance_valid(godot_visual.visual):
			continue

		godot_visual.visual.rotation.y = rotation.yaw
