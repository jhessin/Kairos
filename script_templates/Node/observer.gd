class_name _CLASS_
extends Observer


func watch() -> Resource:
	return Component


func on_component_added(_entity: Entity, _component: Resource):
	pass


func on_component_removed(_entity: Entity, _component: Resource):
	pass


func on_component_changed(
	_entity: Entity,
	_component: Resource,
	_property: String,
	_new_value: Variant,
	_old_value: Variant,
):
	pass
