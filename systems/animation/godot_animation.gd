class_name GodotAnimation
extends RefCounted


static func process(entities: Array[Entity], _components: Array, _delta: float) -> void:
	for entity in entities:
		var animation_state := entity.get_component(C_AnimationState) as C_AnimationState
		var godot_animation := entity.get_component(C_GodotAnimation) as C_GodotAnimation

		var animation_player := godot_animation.animation_player

		if not is_instance_valid(animation_player):
			continue

		if animation_state.current == animation_state.previous:
			continue

		var animation_name := ""

		match animation_state.current:
			C_AnimationState.State.IDLE:
				animation_name = "idle"

			C_AnimationState.State.WALK:
				animation_name = "walk"

			C_AnimationState.State.RUN:
				animation_name = "run"

		if animation_name == "":
			continue

		if animation_player.has_animation(animation_name):
			animation_player.play(animation_name)
