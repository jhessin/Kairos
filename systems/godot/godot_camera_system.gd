class_name GodotCameraSystem
extends System


func deps() -> Dictionary[int, Array]:
  return { Runs.After: [InputSystem] }


func query() -> QueryBuilder:
  return q.with_all([C_CameraState, C_GodotCamera])


func process(entities: Array[Entity], _components: Array, _delta: float) -> void:
  for entity in entities:
    var camera_state := entity.get_component(C_CameraState) as C_CameraState
    var godot_camera := entity.get_component(C_GodotCamera) as C_GodotCamera

    var rig := godot_camera.rig
    var spring_arm := godot_camera.spring_arm

    if not is_instance_valid(rig) or not is_instance_valid(spring_arm):
      continue

    rig.rotation_degrees.x = camera_state.pitch
    rig.rotation_degrees.y = camera_state.yaw

    spring_arm.spring_length = camera_state.distance
