extends Node3D

@onready var world: World = $World


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
  ECS.world = world
  world.finalize_system_setup()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
  ECS.process(delta)


func _physics_process(delta: float) -> void:
  ECS.process(delta, 'physics')
