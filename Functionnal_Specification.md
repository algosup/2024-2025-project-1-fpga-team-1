## Functional Specification

| Author       | Léna De Germain |
|--------------|-----------------|
|Created       |    9/26/2024    |
|Last Modified |    10/01/2024    |

---

<details>

<summary> Table of content </summary>

 - [Functionnal Specification](#functional-specification)
 - [Overview](#overview)
    - [What is Frogger](#what-is-frogger)
    - [How to play](#how-to-play)
 - [Goals and constraints](#goals-and-constraints)
    - [Prototypes Goals](#prototypes-goals)
    - [Final game Goals](#final-game-goals)
    - [Constraints](#constraints)
 - [Requierements / Base Mechanics](#requierements--base-mechanics)
    - [The Frog Mechanics](#the-frog-mechanics)
    - [The Level](#the-level)
    - [Car Mechanics](#car-mechanics)
    - [Added Mechanics](#added-mechanics-optional-feature)
        - [Menu](#menu)
        - [Bonus](#bonus)
        - [Themes](#themes)
 - [Non-functional requirements](#non-functional-requirements)
 - [Deliverable](#deliverable)

</details>

## Overview 

Project aims to recreate the game "Frogger" with our style using FPGA coding in Verilog.

### What is Frogger

Frogger is a video game developed by Konami and released in 1981. The game aims to guide a character from point A to point B. To do this, the player must first move through the game zone, avoiding obstacles that move at different speeds. The character restarts at the beginning of the level if he hits an obstacle; if the score falls to 0, the game restarts at the beginning with a GAME OVER.


### How to play

The player can control the frog using a joystick, allowing movement in all directions. In our version, the buttons on the FPGA board will be used to move the frog.

The game starts with the frog positioned at the bottom of the screen, and the goal is to advance to the top to complete the level. Along the way, the player must avoid various obstacles moving horizontally across the screen, often vehicles.

Frogger can be played solo, but it's also possible to play with two players, taking turns.

![example of frog](image/Frogger_Original_ch.jpg)
![example of frogger in game](image/Frogger_Original_Game.jpg)

## Goals and constraints 

### Prototypes Goals 


### Final game Goals 


### Constraints 
* Game board have for resolution a VGA display like 640x480 and it's reparted on a 20x15 grid.
* It was ask to display the level on the 2-digit 7-segment display on the Go Board.
* For move the player we need to use the four button on Go-board (SW1,SW2,SW3,SW4)
## Requierements / Base Mechanics

|Requierements|Usefullness|
|-|-|
|Main character|a character played by player|
|Main character's design| A basic character design for a basic level and, maybe, a character design for special levels,the dimension are 32x32|
|Obstacles|a character for Obstacles avoided by player|
|Obstacles' design| A basic design for a basic level and, maybe, a design for special levels,the obstacle's dimension are 32x32*(2 or 3)|
|Playground|A space without physique/collision for a play area|

### The Frog Mechanics
The buttons on the FPGA board are used to control the frog and reset the game to the beginning. The frog can only have  one space at a time and after the frog hit a obstacle or finish the level,the frog return on the bottom of the screen.

| Button | Direction |
|-|-|
| SW1 | forward |
| SW2 | backward |
| SW3 | right |
| SW4 | left | 
| SW1 & SW2 & SW3 & SW4 | reset the game |

### The level

The player can view their level on the Go Board using the 2-digit 7-segment display. If the game is reset or the frog is hit by a car, the level indicator resets to 1 (at the beginning). But if the frog reaches the top of the screen, their level increases by one. We've been asked to make the game a 20x15 grid, the screen being 640x480, and one grid corresponds to 32x32 pixels (640/20 = 32, 480/15 = 32).

### Car Mechanics

Mostly the obstacle is vehicles like a car and they appear from the left or the right of the screen and move horizontally on the screen. When the level increases there a more cars at different speeds to make the game more difficult. They are always one car on a horizontal row and they can have a lot of design or the width can be changed.


### Added Mechanics <u>(Optional Feature)</u>

#### Menu
Menu is useful for save or make a pause on game, we could also add some possibility like this :

|Menu's Possibility | button |
|-|-|
|Open Menu and Close Menu |SW1 & SW2 |
|Save Button| SW1 |
|Show up the Score & Level| SW2
|Possibility to change Frog's Appearance| SW3 |
|Have a Register of Different Bonuses| SW4 |


#### Bonus

Bonus

| Bonus | Effect |
|-|-|
|Gift| Increases score by 30 Pts |
|Poison gift| Lowers score by 20 Pts|
|Star| Make the character invincible for 3 seconds |
|Left arrow| Slows down obsctacles|
|Right arrow| Speed up obsctacles|

#### Themes

// Different themes for different levels / Objective :

|Level|Themes|Changement|
|-|-|-|
|4 lvl|Halloween|The frog is replaced by a ghost and the obstacles become pumpkins. |
|8 lvl| Christmas |

## Non-functional requirements 

For correctly, particulary code the game, and running the game need some requirment.

|Non-Functional Requirement|Utility|
|-|-|
|Windows/MacOS|We do all that we need on their computer's system.|
|FPGA board |We program the game on this board, the Go Board from Nandland.com |
|Verilog|It's the language used to program the game.|
|Screen with VGA port|To observe the result of our code, we project it on a VGA Screen. We've been asked to make the game a 20x15 grid, the screen being 640x480, and one square corresponds to 32x32 pixels (640/20 = 32, 480/15 = 32).|
|Cable double VGA port|It's cable is used to connect the FPGA board to VGA Screen|

## Deliverable

Our client, ALGOSUP, asked us to deliver documents and the final product on a precise date.

|Date|Deliverable|
|-|-|
|10/07/2024|Functional Specification Deadline|
|10/14/2024|Technical Specification Deadline|
|10/21/2024|Code Deadline |
|10/21/2024|Test Plan Deadline| 
|10/21/2024|User Manual Deadline|