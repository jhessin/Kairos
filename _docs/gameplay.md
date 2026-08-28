# MMO Gameplay

This document describes the long-term gameplay direction while identifying the systems demonstrated by the Capernaum prototype.

## Core Prototype Loop

The prototype is built around the player's need to remain synchronized with their historical counterpart while investigating disturbances and searching for Miriam.

> **Synchronize → live as the counterpart → investigate → risk desynchronization → enter the Grey Zone → fight → recover → continue the search.**

Combat is therefore an integral part of the narrative rather than a separate activity.

## Travel

Travel between historical zones is unlocked through artifacts discovered in the past. The present-day Kairos team uses those discoveries to identify **Quantum Anchors** and establish access to another time-place reality.

For the prototype, the player remains in one historical zone: Capernaum.

## Synchronization

A Resonant synchronizes with a historical counterpart.

For the prototype, the player's counterpart is **Eliab**.

Everyone in Eliab's community treats the player as Eliab. The player therefore has to learn Eliab's relationships, responsibilities, and expected behavior while searching for evidence of Miriam.

### Sync Stability

The player's synchronization has a visible stability value.

- Compatible choices and behavior can increase or preserve stability.
- Contradictory choices can reduce stability.
- At 0%, the player desynchronizes.
- After a true desynchronization, the current quest restarts from its beginning.

The long-term goal is for higher Quantum Level to allow the player more freedom to deviate from the counterpart without immediately desynchronizing.

### Entering and Exiting Sync

Long term, the player should be able to enter and exit synchronization. The counterpart should continue living their life while the player is absent, meaning they may not be in the same place when the player returns.

This behavior can be simplified for the prototype if necessary.

## Grey Zone

When synchronization becomes unstable, the player can become exposed to a de-synchronized reality called the **Grey Zone**.

The Grey Zone is isolated from ordinary NPC activity and provides the narrative space for supernatural combat.

The Enemy can locate exposed Resonants and send Demons to pull them out of their counterpart.

The prototype should demonstrate:

1. A synchronization disturbance.
2. Transition into the Grey Zone.
3. One Demon encounter.
4. Combat using the player's available Macro.
5. Recovery and return to the historical world.

The player initially does not know whether the hostile presence is another quantum traveler, a corrupted synchronization artifact, or something else. The true spiritual nature of the Enemy is a later revelation.

## Combat

Combat is an Action-RPG system with immediate controls.

Prototype requirements:

- Basic attack
- Short attack combo
- Dodge
- Health and damage
- Enemy targeting
- Enemy death
- One historical hostile encounter
- One Demon encounter

### Targeting

The D-Pad is the intended targeting control.

- **Down:** clear the selected target / return to default self-targeting
- **Left/Right:** cycle hostile targets
- **Up:** cycle friendly targets from nearest to farthest

The targeting system should remain simple in the prototype.

## Gamepad Controls

### Left Stick

Movement.

### L3

Dash / run. Toggle or hold can be a setting later.

### Right Stick

Camera.

### R3

Cycle camera distance, including first-person where supported.

### A

Jump / Confirm.

### B

Cancel / Hold to interact.

### X

Basic Attack / contextual quick action.

### Y

Primary Macro.

### Start

Main menu. Solo content may pause; multiplayer content will not.

### Select

Map modes.

### D-Pad

Targeting and menu navigation.

## Dialogue

Dialogue is a gameplay system because choices can affect synchronization.

Prototype dialogue should support:

- Speaker names
- Dialogue progression
- Player choices
- Choice results
- Quest events
- Synchronization changes

A desynchronized player must restart the current quest from its beginning. The player should be able to see the synchronization effect of previous choices so they can learn how to remain compatible with their counterpart.

## Gathering

Gathering should be simple for the prototype.

Some resources are instantaneous interactions; others can use a short progress bar.

Prototype resources should be limited to the materials needed for the pottery quest.

## Crafting

The prototype contains one simple pottery activity.

The interface should demonstrate the long-term direction without requiring a full crafting tree.

## Macros

Macros are user-created actions assembled from stats, modifiers, abilities, and Words of Power.

Players can find Macro Grids and use one grid at a time.

For the prototype, the first grid is deliberately simple:

- +5 Strength
- Strength determines effectiveness
- Two slots inside an IF/ELSE structure
- `IF ENEMY` → light-infused melee attack
- `ELSE` → simple healing action

The same Word of Power can therefore be used in more than one branch.

## Words of Power

Words of Power are persistent discoveries made during the Main Story Quest.

Prototype Words include:

- **אוֹר — Or** — light / illumination
- **חֹשֶׁךְ — Ḥōshekh (H2822)** — darkness / obscurity

They should be discovered through the story rather than purchased.

## Leveling

Long term, the game has two progression layers.

### Quantum Level

Permanent progression that follows the player between zones.

### Sync Level

Local progression tied to the current historical life.

For the prototype, these systems can be represented minimally. The important behavior is that desynchronization/death resets local progress while permanent discoveries such as Words remain available.

## Archaeology

The prototype does not require a full archaeology simulation.

The player should be guided toward resonant artifacts and perform a small discovery interaction sufficient to establish the narrative function of archaeology.

The final artifact becomes the Quantum Anchor associated with the opening excavation, creating a time-loop and providing a lead for the larger search for Miriam.

## Knowledge / Codex

The prototype Codex records:

- Tutorials
- Quest events
- Discovered Words
- Important discoveries
- Eliab's relationships and contextual knowledge
- Clues related to Miriam

The Codex can provide information supplied through the counterpart's memories/knowledge, reinforcing the player's need to learn Eliab's life while pursuing the rescue mission.
