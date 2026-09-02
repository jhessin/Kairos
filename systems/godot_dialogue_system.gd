class_name GodotDialogueSystem
extends System


func deps() -> Dictionary[int, Array]:
  return { Runs.After: [DialogueSystem] }


func query() -> QueryBuilder:
  return q.with_all([C_Player, C_DialogueState, C_GodotDialogue])


func process(entities: Array[Entity], _components: Array, _delta: float) -> void:
  for entity in entities:
    var player := entity.get_component(C_Player) as C_Player
    var dialogue := entity.get_component(C_DialogueState) as C_DialogueState
    var godot_dialogue := entity.get_component(C_GodotDialogue) as C_GodotDialogue

    if not player.is_local:
      continue

    if not is_instance_valid(godot_dialogue.panel):
      continue

    godot_dialogue.panel.visible = dialogue.active

    if not dialogue.active:
      if godot_dialogue.last_active:
        _render_choices(godot_dialogue, dialogue)
        godot_dialogue.rendered_node_id = StringName()

        godot_dialogue.last_active = false
        Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
      continue

    godot_dialogue.last_active = true
    Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

    if is_instance_valid(godot_dialogue.speaker_label):
      godot_dialogue.speaker_label.text = dialogue.npc.name

    var node := dialogue.get_current_node()

    if is_instance_valid(godot_dialogue.dialogue_label):
      godot_dialogue.dialogue_label.text = node.text

    if node != null and godot_dialogue.rendered_node_id != node.id:
      _render_choices(godot_dialogue, dialogue)
      godot_dialogue.rendered_node_id = node.id


func _render_choices(view: C_GodotDialogue, dialogue: C_DialogueState) -> void:
  for button in view.buttons:
    if is_instance_valid(button):
      button.queue_free()

  view.buttons.clear()

  if not dialogue.active:
    return

  if not dialogue.has_choice():
    return

  if not is_instance_valid(view.choice_container):
    return

  if view.choice_button_scene == null:
    push_error('Dialogue choice button scene is not assigned.')
    return

  var node := dialogue.get_current_node()

  for index in node.choices.size():
    var choice := node.choices[index]
    var button := view.choice_button_scene.instantiate() as Button

    if button == null:
      push_error('Dialogue choice scene must have Button as its root.')
      continue

    button.text = choice.text

    button.pressed.connect(dialogue.queue_choice.bind(index))
    view.choice_container.add_child(button)
    view.buttons.append(button)

    if index == 0:
      button.grab_focus()
