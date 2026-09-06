class_name GodotSystem2d
extends System


func deps() -> Dictionary[int, Array]:
	return { Runs.After: [AnimationSystem], Runs.Before: [InteractionSystem] }
