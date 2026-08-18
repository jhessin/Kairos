@tool
class_name _CLASS_
extends Entity


# Remember Entities are just containers and glue code
func on_ready() -> void:
	# we probably want to sync the component transform to the node transform
	# ECSUtils.sync_transform(self)
	pass


func on_update(_delta: float) -> void:
	pass


func on_destroy() -> void:
	pass
