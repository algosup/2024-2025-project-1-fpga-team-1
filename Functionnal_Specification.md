## Functionnal Specification

| Author       | Léna De Germain |
|--------------|-----------------|
|Created       |    9/26/2024    |
|Last Modified |    9/26/2024    |

---

<details>

<summary> Table of content </summary>

 - [Functionnal Specification](#Functionnal-Specification)
    - [What is Frogger](#What-is-Frogger)
 - [Game Mechanics](#base-mechanics)
    - [Base Mechanics](#base-mechanics)
    - [Added Mechanics](#added-mechanics)
        - [Menu](#menu)
        - [Bonus](#bonus)
        - [Themes](#themes)
 - [Requierements](#requierements)
 - [Goals and constraints](#goals-and-constraints)
    - [Prototypes Goals](#prototypes-goals)
    - [Final game Goals](#final-game-goals)
    - [Contraints](#contraints)
 - [Non-functional requirements](#non-functional-requirements)

</details>

## What is Frogger

Frogger is a video game developed by Konami and released in 1981.
The goal of the game is to guide a character from point A to point B. To do this, the player must first move through the game zone, avoiding obsctacles that move at different speeds.
THe character resterts at the beginning of the level if he hits an obsctacle; if the score falls to 0, the game restarts at the beginning with a GAME OVER.

## Game Mechanics

### Base Mechanics

// Points rules

| Point | Element / Action |
|-|-|
|+100 Pts|Each level completed|
|-20 pts| Each obsctacle touched|
|0 Score| GAME OVER |

### Added Mechanics

#### Menu
// Menu objective

|Menu's Possibility|
|-|
|Save Button|
|Score recalled|
|Possibility to change frog's apparence : <u>Optional Feature</u>|
|Have a register of different bonuses : <u>Optional Feature</u>|

#### Bonus

// Bonus objective : <u>Optional Feature</u>

| Bonus | Effect |
|-|-|
|Gift| Increases score by 30 Pts |
|Poison gift| Lowers score by 20 Pts|
|Star| Make the character invincible for 3 seconds |
|Left arrow| Slows down obsctacles|
|Right arrow| Speed up obsctacles|

#### Themes

// Different themes for different levels / Objective : <u>Optional Feature</u>

|Level|Themes|Changement|
|-|-|-|
|?? lvl|Halloween|The frog is replaced by a ghost and the obstacles become pumpkins. |
|?? lvl| Christmas ||


## Requierements 

// Plus expliquer : 

|Requierements|Utility|
|-|-|
|Windows/MacOS||
|FPGA board ||
|Verilog||
|Screen with VGA port||
|Cable double VGA port||

## Goals and constraints 

### Prototypes Goals 

### Final game Goals 

### Contraints 

## Non-functional requirements 

