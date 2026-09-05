extends Node

@warning_ignore_start('unused_signal')
signal interacted(source: Entity, target: Entity)
signal collected(source: Entity, target: Entity)
signal killed(source: Entity, target: Entity)
signal dialogue_signal(source: Entity, value: String)
