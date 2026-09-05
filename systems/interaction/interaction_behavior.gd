class_name InteractionBehavior
extends RefCounted


static func process(entities: Array[Entity], _components: Array, _delta: float) -> void:
	for entity in entities:
		var behavior := entity.get_component(C_InteractionBehavior) as C_InteractionBehavior

		if not behavior.callback.is_valid():
			continue

		var requests := _find_requests_for_target(entity)

		for request in requests:
			_execute_behavior(behavior, request)


static func _find_requests_for_target(target: Entity) -> Array:
	var requests := []

	for player in ECS.world.entities:
		var request := player.get_component(C_InteractionRequest) as C_InteractionRequest

		if request == null:
			continue

		if not request.requested:
			continue

		if request.target != target:
			continue

		requests.append(request)

	return requests


static func _execute_behavior(
	behavior: C_InteractionBehavior,
	request: C_InteractionRequest,
) -> void:
	var source := request.source
	var target := request.target

	behavior.callback.call(request.source)

	GameEventBus.interacted.emit(source, target)

	request.requested = false
	request.source = null
	request.target = null
