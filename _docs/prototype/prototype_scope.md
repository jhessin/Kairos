# Kairos Prototype Scope

## Target

**30–45 minute single-player vertical slice.**

The prototype must prove the central Kairos experience:

> **Live as a historical counterpart, maintain synchronization, investigate a timeline disturbance, survive the Grey Zone, and return with a discovery that advances the larger mystery.**

---

## Included

### World

- Modern Kairos facility
- White Room / synchronization tutorial
- One historical environment: Capernaum
- One small Grey Zone combat space

### Modern Characters

- Miriam Halevi — mentor / stranded Resonant hook
- Evelyn Saroyan — archaeology
- Daniel Kessler — physics
- Marcus Ellington — VR / quantum-computer integration
- Asha Raman — synchronization systems
- Naomi Feld — linguistics
- Sarah — AI interface to the quantum computer

### Historical Characters

- Eliab — player's counterpart
- Yohanan — Eliab's friend and combat trainer
- Mara — Eliab's wife
- Yosef — Eliab's master and Mara's father

### Enemies

- Small historical hostile group / bandits
- One Demon type

---

## Quest Chain

1. **Q001 — A Stranger in Eliab's Life**
2. **Q002 — The Master's Errand**
3. **Q003 — A Friend's Challenge**
4. **Q004 — A Wife's Question**
5. **Q005 — Something Is Wrong**
6. **Q006 — Into the Grey**
7. **Q007 — The Word**
8. **Q008 — The Anchor**
9. **Q009 — Return**

Each quest has one primary narrative/gameplay purpose. The chain introduces systems progressively rather than presenting every system at once.

---

## Gameplay

### Movement

- Existing WASD and gamepad movement
- Tuned exploration and combat movement

### Camera

- Smooth third-person camera
- Existing first-person/zoom support where practical

### Interaction

- NPC interaction
- Object interaction
- Contextual interaction prompts

### Dialogue

- Dialogue panel
- Speaker identification
- Player choices
- Choice consequences
- Quest events
- Synchronization changes

### Quests

- Quest state
- Objective list
- Quest completion
- Quest-chain progression
- Rewards

### Gathering

- Clay
- Water
- One simple fuel/material resource

### Crafting

- One simple pottery recipe
- Minimal crafting interface

### Combat

- Basic attack
- Three-hit basic combo where animation support allows
- Dodge
- Health/damage
- Enemy targeting via D-Pad
- Enemy death
- Historical combat encounter
- Demon combat encounter

### Synchronization

- Sync Stability displayed to the player
- Dialogue choices can increase/decrease synchronization
- Desynchronization occurs when stability reaches zero
- Current quest restarts after a true desynchronization
- Early Quantum Level progression may be represented minimally

### Grey Zone

- Triggered by major synchronization instability
- Isolated from normal NPC activity
- Contains the first Demon encounter
- Returns the player to the historical world after combat/recovery

### Words of Power

- More than one early-game Word exists
- **אוֹר — Or**: light / illumination
- **חֹשֶׁךְ — Ḥōshekh, Strong's H2822**: darkness / obscurity

### Macro Grid

The first Macro Grid is intentionally simple.

- +5 Strength
- Strength determines effectiveness
- Two slots inside an IF/ELSE structure
- `IF ENEMY` → Or-infused melee attack
- `ELSE` → simple healing action

The prototype demonstrates that one Word can participate in more than one branch of a Macro.

### Archaeology

The prototype uses a deliberately simplified archaeological interaction.

The player is guided toward the resonant artifact's location. The important result is not a full excavation simulation but the discovery of the object that creates the Quantum Anchor and closes the time-loop established by the opening excavation.

### Knowledge / Codex

The Codex records:

- tutorials
- quest events
- discovered Words
- important discoveries
- Eliab's known relationships and context

### Quantum Anchor

The player ultimately creates/discovers the Anchor that corresponds to the artifact encountered by Miriam and Evelyn in the opening.

The Anchor provides the bridge between the past and present and establishes the next historical destination.

---

## Prototype Story Requirements

The prototype must establish:

- Miriam's initial Resonance experience
- The Kairos Initiative
- The player's Resonant status
- Eliab as the player's counterpart
- The player's need to live as Eliab
- Capernaum as the first historical zone
- Synchronization as a survival mechanic
- A timeline/historical disturbance
- The Grey Zone
- Demons as a consequence of desynchronization
- The first Word of Power
- The first Macro
- The Quantum Anchor
- Return to the modern world
- A cliffhanger leading to the next zone

The Enemy's true spiritual identity remains unresolved in the prototype. The player initially has reason to suspect another quantum traveler or anomalous Resonant.

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

If a feature is not necessary to demonstrate the core Kairos experience, it belongs outside the prototype.
