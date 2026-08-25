# Kairos Prototype Scope

## Target

30–45 minute single-player vertical slice.

---

## Included

### World

- Modern Kairos facility
- White Room Tutorial
- One historical environment
  - Capernaum

### Characters

- Miriam Halevi (Physics)
- Evelyn Saroyan (Archaeology)
- Daniel Kessler (Physics)
- Marcus Ellington (VR/Medical)
- Asha Raman (Sarah)
- Naomi Feld (Linguist)
- Eliab (Player counterpart)
- Yohanan (Eliab's friend)
- Mara (Eliab's wife)
- Yosef (Eliab's father)
- Bandit Leader
- Bandit Lackey #1
- Bandit Lackey #2

### Gameplay

- Movement
  - WASD and Gamepad movement.
  - The speed the player moves should change depending on the area they are in.
    For exploration it will be a bit slower than in combat situations
    (simulating an adrenaline rush).
- Camera
  - Smooth camera movement and transition from/to first person.
- Interaction
  - An interaction menu should pop up if the player is near more than one
    intractable object.
  - The arrows or D-Pad should be used to navigate this menu.
- Dialogue
  - The dialogue panel should have a skin and look polished.
- Dialogue Options
  - The player should be able to select from a list of responses.
- Quest objectives
  - The quest objectives should be shown in a list on the right side of the
    screen.
- Gathering
  - Gathering should be a straight forward interaction.
  - Sometimes it will be instantaneous (pick up a pot) and other times it will
    involve a progress bar (mine clay).
- Crafting
  - The crafting interface should almost be mine-craft like in it's simplicity.
    A grid for the materials and several other slots for tools and catalysts.
- Combat
  - Simple hack and slash. There should be at least three separate attack
    animations for a standard combo.
  - There should be a separate animation for each Word of Power grid.
- Death
  - Something to be avoided.
  - Resets Sync level but not Quantum level.
- Basic progression
- Words of Power
  - Must have more than one to show how the system changes with different words.
- Macro Grid
  - The first Macro Grid the player finds is a simple one.
  - It gives +5 to Strength
  - It uses Strength to determine it's effectiveness
  - It has two slots surrounded by an if-else directive.
  - IF ENEMY _blank_ ELSE _blank_
  - This demonstrates that the same Word of Power can be used more than once.
  - **אוֹר — Or** - light
  - In the first slot this will be a light infused melee attack, and in the
    second slot it will be a simple lay on hands type heal.
- Archaeology
  - This is not a true Gameplay mechanic. The player will feel led to the
    location of the resonant artifact after he creates or finds the anchor. This
    will effectively _move_ the artifact from it's original location to it's
    final resting place where the main characters found it in the opening scene
    creating a time loop.
- Knowledge/Codex
  - This will function as a basic log of tutorials, quest points, and events
    that the player can look back on.
  - This will also give 'meta' information that is provided by the players
    counterpart. For example the codex will prompt the player telling them they
    know Eliab and who he is to them.
- Synchronization
  - The player should be able to enter and exit synchronization at any time.
    Ideally the counterpart will keep going about their business while the player
    is not synchronizing and they won't necessarily be in the same place when the
    player jumps back in.
  - When the player first desynchronizes (their synchronization reaches 0%). A
    cutscene should play to indicate that the quantum reality is shifting around
    to re-synchronize with the player to get back to a stable state this adds
    many more questions for the NPC's to discuss later and adds re-playability.
  - As the player's quantum level increases they will find they can deviate more
    from their counterpart's actions without de-synchronization.
- Quantum Anchor
  - The anchor should be something crafted by the player - this creates a
    continuity as it is found in the present day and the player can later
    synchronize with another person later in the life of the object.

### Story

- Opening excavation
- Kairos introduction
- First synchronization
- Capernaum
- First Word of Power
- First Macro Grid
- Quantum Anchor
- Return to modern world
- Prototype ending

---

## Explicitly Excluded

- Multiplayer
- MMO networking
- Trading
- Guilds
- Player housing
- Mounts
- Swimming
- Multiple historical zones
- Large skill trees
- Large crafting trees
- Full economy
- Large NPC simulation
- Player classes
- Extensive character customization
- Server persistence
- Large-scale procedural generation

---

## Rule

If a feature is not necessary to demonstrate the core Kairos experience,
it belongs outside the prototype.
