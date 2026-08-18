@tool
class_name PlayerEntity
extends Entity

@onready var body: CharacterBody3D = %PlayerView


# Remember Entities are just containers and glue code
func on_ready() -> void:
  # we probably want to sync the component transform to the node transform
  self.add_components(
    [CPlayer.new(), CMovement.new(), CPlayerInput.new(), CVelocity.new(), CTransform.new()]
  )
  pass


func on_update(_delta: float) -> void:
  pass


func on_destroy() -> void:
  pass
