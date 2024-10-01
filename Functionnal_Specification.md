## Functionnal Specification

| Author       | Léna De Germain |
|--------------|-----------------|
|Created       |    9/26/2024    |
|Last Modified |    9/30/2024    |

---

<details>

<summary> Table of content </summary>

 - [Functionnal Specification](#Functionnal-Specification)
 - [Overview](#overview)
    - [What is Frogger](#What-is-Frogger)
    - [How to play](#how-to-play)
 - [Game Mechanics](#game-mechanics)
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
 - [Deliverable](#deliverable)

</details>

## Overview 

The goal of the project is recreate the game "Frogger" with our own style using FPGA coding in Verilog.

### What is Frogger

Frogger is a video game developed by Konami and released in 1981. The game aims to guide a character from point A to point B. To do this, the player must first move through the game zone, avoiding obstacles that move at different speeds. The character restarts at the beginning of the level if he hits an obstacle; if the score falls to 0, the game restarts at the beginning with a GAME OVER

![]()

### How to play

The player can control the frog using a joystick, allowing movement in all directions. In our version, the buttons on the FPGA board will be used to move the frog.

The game starts with the frog positioned at the bottom of the screen, and the goal is to advance to the top to complete the level. Along the way, the player must avoid various obstacles moving horizontally across the screen, often vehicles.

Frogger can be played solo, but it's also possible to play with two players, taking turns.

![example of frog](image/Frogger_Original_ch.jpg)
![example of frogger in game](image/Frogger_Original_Game.jpg)

## Game Mechanics

### Base Mechanics

The buttons on the FPGA board are used to control the frog and reset the game to the begining.The frog can only one space at a time.
| Button | Direction |
|-|-|
| SW1 | forward |
| SW2 | backward |
| SW3 | right |
| SW4 | left | 
| SW1 & SW2 & SW3 & SW4 | reset the game |

// 

| Point | Element / Action |
|-|-|
|+ 100 Pts|Each level completed|
|- 20 Pts| Each obsctacle touched|
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
|31 lvl|Halloween|The frog is replaced by a ghost and the obstacles become pumpkins. |
|25 lvl| Christmas ||


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

## Deliverable

Our client, ALGOSUP, asked us to deliver documents and the final product on precise date.

|Date|Deliverable|
|-|-|
|10/07/2024|Functional Specification Deadline|
|10/14/2024|Technical Specification Deadline|
|10/21/2024|Code Deadline |
|10/21/2024|Test Plan Deadline| 
|10/21/2024|User Manual Deadline|