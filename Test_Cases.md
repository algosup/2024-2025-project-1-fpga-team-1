## Test Cases

<details>

<summary> Table of content </summary>

- [Test Cases](#test-cases)
- [Overview](#overview)
- [Priority](#priority)
- [Tests](#tests)
  - [1. Start the Game](#1-start-the-game)
  - [2. Stop the Game](#2-stop-the-game)
  - [3. Car movement](#3-car-movement)
  - [4. Move FroggyRanck Up](#4-move-froggyranck-up)
  - [5. Move FroggyRanck Down](#5-move-froggyranck-down)
  - [6. Move FroggyRanck Left](#6-move-froggyranck-left)
  - [7. Move FroggyRanck Right](#7-move-froggyranck-right)
  - [8. Reset the game](#8-reset-the-game)
  - [9. FroggyRanck Collision: Screen border](#9-froggyranck-collision-screen-border)
  - [10. FroggyRanck Collision: Car Without a Star](#10-froggyranck-collision-car-without-a-star)
  - [11. Level is indicated on the 7-segment display](#11-level-is-indicated-on-the-7-segment-display)
  - [12. Open Menu](#12-open-menu)
  - [13. Close Menu](#13-close-menu)
  - [14. Save Game](#14-save-game)
  - [XX. FroggyRanck Collision: Car With a Star](#xx-froggyranck-collision-car-with-a-star)
  - [XX.](#xx)



</details>

## Overview

This document outlines the test scenarios to ensure the proper functioning of the FroggyRanck application during gameplay.

## Priority

Test priorities are indicated by the following colors:

|Color|Priority|
|:-:|:-:|
|🟡|Low|
|🟠|Medium|
|🔴|High|

## Tests

### 1. Start the Game

| ID | T01 |
| --- | --- |
| Name | Start the Game |
| Test Description | Verify that the game starts successfully |
| Requirement(s) | The game is not started |
| Step(s) | 1. Plug a micro USB cable to FPGA Board, <br> 2. Plug a VGA cable to FPGA Board |
| Expected Result | The game starts |
| Priority | 🔴 |

### 2. Stop the Game

| ID | T02 |
| --- | --- |
| Name | Stop the Game |
| Test Description | Verify that the game stops properly |
| Requirement(s) | The game is started |
| Step(s) | 1. Unplug micro USB cable or VGA cable |
| Expected Result | The game stops |
| Priority | 🔴 |

### 3. Car movement

| ID | T03 |
| --- | --- |
| Name | Car movement |
| Test Description | Verify Car move on a line from right to left or reverse depend the car |
| Requirement(s) | The game is started |
| Step(s) | 1. Start the game, <br> 2. Verify car's moves |
| Expected Result |  |
| Priority |🔴|

### 4. Move FroggyRanck Up

| ID | T04 |
| --- | --- |
| Name | Move FroggyRanck Up |
| Test Description | Verify FroggyRanck moves up when the FPGA Board's Switch 1 is pressed and there is no wall |
| Requirement(s) | The game is started |
| Step(s) | 1. Start the game, <br> 2. Press Switch 1 in FPGA Board |
| Expected Result | FroggyRanck moves up |
| Priority | 🔴 |

### 5. Move FroggyRanck Down

| ID | T05 |
| --- | --- |
| Name | Move FroggyRanck Down |
| Test Description | Verify FroggyRanck moves down when the FPGA Board's Switch 2 is pressed and there is no wall |
| Requirement(s) | The game is started |
| Step(s) | 1. Start the game, <br> 2. Press Switch 2 in FPGA Board |
| Expected Result | FroggyRanck moves down |
| Priority | 🔴 |

### 6. Move FroggyRanck Left

| ID | T06 |
| --- | --- |
| Name | Move FroggyRanck Right |
| Test Description | Verify FroggyRanck moves left when the FPGA Board's Switch 3 is pressed and there is no wall |
| Requirement(s) | The game is started |
| Step(s) | 1. Start the game, <br> 2. Press Switch 3 in FPGA Board |
| Expected Result | FroggyRanck moves left |
| Priority | 🔴 |

### 7. Move FroggyRanck Right

| ID | T07 |
| --- | --- |
| Name | Move FroggyRanck Left |
| Test Description | Verify FroggyRanck moves right when the FPGA Board's Switch 4 is pressed and there is no wall |
| Requirement(s) | The game is started |
| Step(s) | 1. Start the game, <br> 2. Press Switch 4 in FPGA Board |
| Expected Result | FroggyRanck moves right |
| Priority | 🔴 |

### 8. Reset the game

|ID|T08|
|---|---|
|Name|Reset the game|
|Test Description|Verify the game is reset when FPGA board's Switch 1, 2, 3 and 4 are pressed.|
|Requiremennt(s)|The game is started, frogger is not at the start position. |
|Step(s)|1. Start the game,<br> 2. Move with Frogger, <br> Press Switch 1, 2, 3 and 4 at the same time.|
|Expected Result|Game is reset|
|Priority|🔴|

### 9. FroggyRanck Collision: Screen border

| ID | T09 |
| --- | --- |
| Name | FroggyRanck Collision: Screen border |
| Test Description | Verify FroggyRanck is stopped by screen border and cannot pass through it |
| Requirement(s) | The game is started |
| Step(s) | 1. Start the game, <br> 2. Move toward screen limit |
| Expected Result | FroggyRanck is stopped and cannot pass through the screen border |
| Priority | 🔴 |

### 10. FroggyRanck Collision: Car Without a Star

| ID | T10 |
| --- | --- |
| Name | FroggyRanck Collision: Car Without Star |
| Test Description | Verify FroggyRanck is killed by a car when colliding without a Star |
| Requirement(s) | The game is started |
| Step(s) | 1. Start the game, <br> 2. Move toward a car |
| Expected Result | FroggyRanck is killed by the car |
| Priority | 🔴 |

### 11. Level is indicated on the 7-segment display

|ID|T11|
|-|-|
|Name|Level is indicated on the 7-segment display|
|Test Description|Verify curant level is indicated on the 7-segment display |
|Requiremennt(s)|The game is started, 7-segment display is on|
|Step(s)|1. Start the game,<br> Check 7-segment display|
|Expected Result|At the first level, 7-segment display need to indicat "01".|
|Priority|🔴|

### 12. Open Menu

| ID | T12 |
| --- | --- |
| Name | Open Menu |
| Test Description | Verify Menu is oppened when FPGA board's Switch 1 and 2 are pressed |
| Requirement(s) | The game is started |
| Step(s) | 1. Start the game, <br> 2. Press Switch 1 and 2 at the same time|
| Expected Result | Menu is opened |
| Priority |🟠|*

### 13. Close Menu

| ID | T13 |
| --- | --- |
| Name | Close Menu |
| Test Description | Verify Menu is closed when FPGA board's Switch 1 and 2 are pressed |
| Requirement(s) | The game is started, Menu is oppened |
| Step(s) | 1. Start the game, <br> 2. Open Menu <br>3. Press Switch 1 and 2 at the same time|
| Expected Result | Menu is Close |
| Priority |🟠|

### 14. Save Game

| ID | T14 |
| --- | --- |
| Name | Save Game |
| Test Description | Verify game is saved when FPGA board's Switch 1 is pressed |
| Requirement(s) | The game is started, Menu is oppened |
| Step(s) | 1. Start the game, <br> 2. Open Menu <br>3. Press Switch 1.|
| Expected Result | Game has been save and a Text "Game Saved" is displayed.|
| Priority |🟠|

### XX. FroggyRanck Collision: Car With a Star

| ID | TXX |
| --- | --- |
| Name | FroggyRanck Collision: Car With a Star |
| Test Description | Verify FroggyRanck don't been affected by a car when colliding with a star |
| Requirement(s) | The game is started, FroggyRanck take a star |
| Step(s) | 1. Start the game,<br> 2. Take a star,<br> 3. Move toward a car |
| Expected Result | FroggyRanck don't been affected by a car |
| Priority | 🟠 |

### XX. 

| ID | TXX |
| --- | --- |
| Name |  |
| Test Description | Verify  |
| Requirement(s) | The game is started |
| Step(s) | 1. Start the game, <br> 2. |
| Expected Result |  |
| Priority | 🔴 or 🟠 or 🟡|