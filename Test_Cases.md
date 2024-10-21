## Test Cases

| Author       | Alexis SANTOS |
|--------------|---------------|
|Created       |   9/26/2024   |
|Last Modified |   10/21/2024  |


<details>

<summary> Table of content </summary>

- [Test Cases](#test-cases)
- [Overview](#overview)
- [Priority](#priority)
- [Tests](#tests)
  - [01. Start the Game](#01-start-the-game)
  - [02. Screen displayed](#02-screen-displayed)
  - [03. Stop the Game](#03-stop-the-game)
  - [04. Reset the game](#04-reset-the-game)
  - [05. Car movement](#05-car-movement)
  - [06. Car speed increased to every level](#06-car-speed-increased-to-every-level)
  - [07. Move FroggyRanck Up](#07-move-froggyranck-up)
  - [08. Move FroggyRanck Down](#08-move-froggyranck-down)
  - [09. Move FroggyRanck Left](#09-move-froggyranck-left)
  - [10. Move FroggyRanck Right](#10-move-froggyranck-right)
  - [11. Time deplacement](#11-time-deplacement)
  - [12. FroggyRanck Collision: Screen border](#12-froggyranck-collision-screen-border)
  - [13. FroggyRanck Collision: Car](#13-froggyranck-collision-car)
  - [14. Level is indicated on the 7-segment display](#14-level-is-indicated-on-the-7-segment-display)
  - [15. Level score increased](#15-level-score-increased)
  - [16. Display Car sprite](#16-display-car-sprite)
  - [17. Display FroggyRanck's sprite](#17-display-froggyrancks-sprite)
  - [18. Have four lives in game](#18-have-four-lives-in-game)
  - [19. Game restarts after all lives have been consumed](#19-game-restarts-after-all-lives-have-been-consumed)
  - [20. Display score on the screen](#20-display-score-on-the-screen)
  - [21. Score increased when a level is complete](#21-score-increased-when-a-level-is-complete)
  - [22. Score increased when positive bonuses has taken](#22-score-increased-when-positive-bonuses-has-taken)
  - [23. Score reset when FroggyRanck hit a car](#23-score-reset-when-froggyranck-hit-a-car)
  - [24. Score desincreased when negative bonuses has taken](#24-score-desincreased-when-negative-bonuses-has-taken)
  - [25. Open Menu](#25-open-menu)
  - [26. Close Menu](#26-close-menu)
  - [27. Save Game](#27-save-game)
  - [28. Show up level and score](#28-show-up-level-and-score)
  - [29. Change FroggyRanck's appearance](#29-change-froggyrancks-appearance)
  - [30. Display a register of bonuses](#30-display-a-register-of-bonuses)



</details>

## Overview

This document outlines the test scenarios to ensure the proper functioning of the FroggyRanck application during gameplay.

## Priority

Test priorities are indicated by the following colors:

|Color|Priority|
|:-:|:-:|
|🟢|Very Low|
|🟡|Low|
|🟠|Medium|
|🔴|High|

## Tests

### 01. Start the Game

| ID | T01 |
| --- | --- |
| Name | Start the Game |
| Test Description | Verify that the game starts successfully |
| Requirement(s) | The game is not started |
| Step(s) | 1. Plug a micro USB cable to FPGA Board, <br> 2. Plug a VGA cable to FPGA Board |
| Expected Result | The game starts |
| Priority | 🔴 |
|Test result|Game has started|

### 02. Screen displayed

| ID | T02 |
| --- | --- |
| Name | Screen displayed |
| Test Description | Verify if the game is display on the screen when we connect the board. |
| Requirement(s) | The game is started |
| Step(s) | 1. Start the game, <br> 2. Look if screen responding. |
| Expected Result | We have the game on the VGA screen or HDMI screen with an adaptator|
| Priority |🔴|
|Test result|Game is displayed|

### 03. Stop the Game

| ID | T03 |
| --- | --- |
| Name | Stop the Game |
| Test Description | Verify that the game stops properly |
| Requirement(s) | The game is started |
| Step(s) | 1. Unplug micro USB cable or VGA cable |
| Expected Result | The game stops |
| Priority | 🔴 |
|Test result|Game is stoped|

### 04. Reset the game

|ID|T04|
|---|---|
|Name|Reset the game|
|Test Description|Verify the game is reset when FPGA board's Switch 1, 2, 3 and 4 are pressed.|
|Requiremennt(s)|The game is started, FroggyRanck is not at the start position. |
|Step(s)|1. Start the game,<br> 2. Move with FroggyRanck, <br> Press Switch 1, 2, 3 and 4 at the same time.|
|Expected Result|Game is reset|
|Priority|🔴|
|Test result|Game has been reset|

### 05. Car movement

| ID | T05 |
| --- | --- |
| Name | Car movement |
| Test Description | Verify Car move on a line from right to left or reverse depend the car with "random" speed|
| Requirement(s) | The game is started |
| Step(s) | 1. Start the game, <br> 2. Verify car's moves |
| Expected Result | Cars move at different same speed. |
| Priority |🔴|
|Test result|Car moved with a same speed and differents directions.|

### 06. Car speed increased to every level

| ID | T06 |
| --- | --- |
| Name | Car speed increased to every level |
| Test Description | Verify car have been more speedy at every next level. |
| Requirement(s) | The game is started |
| Step(s) | 1. Start the game, <br> 2. Check car speed, <br> 3. Cross and win a level |
| Expected Result | Compare car speed between two levels. |
| Priority |🟠|
|Test result|For now, car don't been more speedy at every next level|
|Test result 2|Cars have been more speedy at every next level now|

### 07. Move FroggyRanck Up

| ID | T07 |
| --- | --- |
| Name | Move FroggyRanck Up |
| Test Description | Verify FroggyRanck moves up when the FPGA Board's Switch 1 is pressed and there is no wall |
| Requirement(s) | The game is started |
| Step(s) | 1. Start the game, <br> 2. Press Switch 1 in FPGA Board |
| Expected Result | FroggyRanck moves up |
| Priority |🔴|
|Test result|That worked|

### 08. Move FroggyRanck Down

| ID | T08 |
| --- | --- |
| Name | Move FroggyRanck Down |
| Test Description | Verify FroggyRanck moves down when the FPGA Board's Switch 2 is pressed and there is no wall |
| Requirement(s) | The game is started |
| Step(s) | 1. Start the game, <br> 2. Press Switch 2 in FPGA Board |
| Expected Result | FroggyRanck moves down |
| Priority |🔴|
|Test result|That worked|

### 09. Move FroggyRanck Left

| ID | T09 |
| --- | --- |
| Name | Move FroggyRanck Right |
| Test Description | Verify FroggyRanck moves left when the FPGA Board's Switch 3 is pressed and there is no wall |
| Requirement(s) | The game is started |
| Step(s) | 1. Start the game, <br> 2. Press Switch 3 in FPGA Board |
| Expected Result | FroggyRanck moves left |
| Priority |🔴|
|Test result|That worked|

### 10. Move FroggyRanck Right

| ID | T10 |
| --- | --- |
| Name | Move FroggyRanck Left |
| Test Description | Verify FroggyRanck moves right when the FPGA Board's Switch 4 is pressed and there is no wall |
| Requirement(s) | The game is started |
| Step(s) | 1. Start the game, <br> 2. Press Switch 4 in FPGA Board |
| Expected Result | FroggyRanck moves right |
| Priority |🔴|
|Test result|That worked|

### 11. Time deplacement

| ID | T11 |
| --- | --- |
| Name | Time deplacement |
| Test Description | Verify we can move every milliseconds and not less |
| Requirement(s) | The game is started |
| Step(s) | 1. Start the game, <br> 2. Move FroggyRanck as faster as possible. |
| Expected Result | We can only move FroggyRanck every milliseconds and not less. |
| Priority |🟠|
|Test result|It is done. Deplacement are limited.|

### 12. FroggyRanck Collision: Screen border

| ID | T12 |
| --- | --- |
| Name | FroggyRanck Collision: Screen border |
| Test Description | Verify FroggyRanck is stopped by screen border and cannot pass through it |
| Requirement(s) | The game is started |
| Step(s) | 1. Start the game, <br> 2. Move toward screen limit |
| Expected Result | FroggyRanck is stopped and cannot pass through the screen border |
| Priority | 🔴 |
|Test result|Screen border are done at bettom, left and top. But, in right, border is one grid after.|
|Test result 2| It is patched|

### 13. FroggyRanck Collision: Car

| ID | T13 |
| --- | --- |
| Name | FroggyRanck Collision: Car|
| Test Description | Verify FroggyRanck is killed by a car when colliding without a Star |
| Requirement(s) | The game is started |
| Step(s) | 1. Start the game, <br> 2. Move toward a car |
| Expected Result | FroggyRanck is killed by the car and it return to the beginning of level |
| Priority | 🔴 |
|Test result|This is done|

### 14. Level is indicated on the 7-segment display

|ID|T14|
|-|-|
|Name|Level is indicated on the 7-segment display|
|Test Description|Verify curant level is indicated on the 7-segment display |
|Requiremennt(s)|The game is started, 7-segment display is on|
|Step(s)|1. Start the game,<br> Check 7-segment display|
|Expected Result|At the first level, 7-segment display need to indicat "01".|
|Priority|🔴|
|Test result|Level count worked|

### 15. Level score increased

| ID | T15 |
| --- | --- |
| Name | Level score increased |
| Test Description | Verify the level score have been modified when a level is finished |
| Requirement(s) | The game is started |
| Step(s) | 1. Start the game, <br> 2. Win a level <br> 3. Look if level score have been increased <br> 4. Win until level 10. <br> 5. Check if level score have been increased to 10.|
| Expected Result | Level score has been increased by 1 until 10 and more.|
| Priority |🔴|
|Test result|level score worked correctly|

### 16. Display Car sprite 

| ID | T16 |
| --- | --- |
| Name | Display Car sprite |
| Test Description | Verify the cars sprite are displayed. |
| Requirement(s) | The game is started |
| Step(s) | 1. Start the game, <br> 2. See cars sprite |
| Expected Result | cars sprite are one we have drawn on 32x32 or 32x64. |
| Priority |🟡|
|Test result|We have a sprite for all car|

### 17. Display FroggyRanck's sprite 

| ID | T17 |
| --- | --- |
| Name | Display FroggyRanck sprite |
| Test Description | Verify the FroggyRanck sprite is displayed. |
| Requirement(s) | The game is started |
| Step(s) | 1. Start the game, <br> 2. See FroggyRanck sprite |
| Expected Result | FroggyRanck sprite is one we have drawn on 32x32. |
| Priority |🟡|
|Test result|We have a sprite for the FroggyRanck|

### 18. Have four lives in game  

| ID | T18 |
| --- | --- |
| Name | Have four lives in game  |
| Test Description | Verify FroggyRanck have four lives. |
| Requirement(s) | The game is started |
| Step(s) | 1. Start the game, <br> 2. hit a car, <br> 3. Look if a LED has been turned off (LED corresponded to lives score)|
| Expected Result | a LED has been turned off.  |
| Priority |🟡|
|Test result|LED has been turned off correctly.|


### 19. Game restarts after all lives have been consumed   

| ID | T19 |
| --- | --- |
| Name | Game restarts after all lives have been consumed |
| Test Description | Verify game has been restart after all lives have been used. |
| Requirement(s) | The game is started |
| Step(s) | 1. Start the game, <br> 2. Play for have at least a level completed, <br> 3. hit egnouth car for consumed all lives, <br> 4. Look if car speed and level score have been reset|
| Expected Result | Car speed and level score have been reset |
| Priority |🟡|
|Test result|When we played and we losed all lives. LED, level score, car speed and FroggyRanck position have been reset. So the game has been corectly reset.|

### 20. Display score on the screen 

| ID | T20 |
| --- | --- |
| Name | Display score on the screen |
| Test Description | Verify score is displayed on the screen |
| Requirement(s) | The game is started |
| Step(s) | 1. Start the game, <br> 2. Check if we have a score indicator on the screen. |
| Expected Result | We have a score display with a number associate |
| Priority |🟠|
|Test result||

### 21. Score increased when a level is complete

| ID | T21 |
| --- | --- |
| Name | Score increased when a level is complete |
| Test Description | Verify the score have been modified when we finish a level |
| Requirement(s) | The game is started |
| Step(s) | 1. Start the game, <br> 2. Win a level <br> 3. Look if score have been increased |
| Expected Result | Score has been increased by 100 points. |
| Priority |🟠|
|Test result||

### 22. Score increased when positive bonuses has taken

| ID | T22 |
| --- | --- |
| Name | Score increased when positive bonuses has taken |
| Test Description | Verify the score have been modified when a positive bonuses has taken. |
| Requirement(s) | The game is started |
| Step(s) | 1. Start the game, <br> 2. Take a positive bonuses <br> 3. Look if score have been increased |
| Expected Result | Score has been increased by some points in link to bonuses description. |
| Priority |🟡|
|Test result||

### 23. Score reset when FroggyRanck hit a car

| ID | T23 |
| --- | --- |
| Name | Score desincreased when FroggyRanck hit a car |
| Test Description | Verify the score have been modified when FroggyRanck hit a car. |
| Requirement(s) | The game is started |
| Step(s) | 1. Start the game, <br> 2. Hit a car <br> 3. Look if score have been reset |
| Expected Result | Score has been reset to 0. |
| Priority |🟠|
|Test result||

### 24. Score desincreased when negative bonuses has taken

| ID | T24 |
| --- | --- |
| Name | Score desincreased when negative bonuses has taken |
| Test Description | Verify the score have been modified when a negative bonuses has taken. |
| Requirement(s) | The game is started |
| Step(s) | 1. Start the game, <br> 2. Take a negative bonuses <br> 3. Look if score have been desincreased |
| Expected Result | Score has been desincreased by some points in link to bonuses description.|
| Priority |🟡|
|Test result||

### 25. Open Menu

| ID | T25 |
| --- | --- |
| Name | Open Menu |
| Test Description | Verify Menu is oppened when FPGA board's Switch 1 and 2 are pressed |
| Requirement(s) | The game is started |
| Step(s) | 1. Start the game, <br> 2. Press Switch 1 and 2 at the same time.|
| Expected Result | Menu is opened |
| Priority |🟠|
|Test result||

### 26. Close Menu

| ID | T26 |
| --- | --- |
| Name | Close Menu |
| Test Description | Verify Menu is closed when FPGA board's Switch 1 and 2 are pressed |
| Requirement(s) | The game is started, Menu is oppened |
| Step(s) | 1. Start the game, <br> 2. Open menu, <br>3. Press Switch 1 and 2 at the same time.|
| Expected Result | Menu is Close |
| Priority |🟠|
|Test result||

### 27. Save Game

| ID | T27 |
| --- | --- |
| Name | Save Game |
| Test Description | Verify game is saved when FPGA board's Switch 1 is pressed |
| Requirement(s) | The game is started, Menu is oppened |
| Step(s) | 1. Start the game, <br> 2. Open menu, <br>3. Press Switch 1.|
| Expected Result | Game has been save and a Text "Game Saved" is displayed.|
| Priority |🟠|
|Test result||

### 28. Show up level and score

| ID | T28 |
| --- | --- |
| Name | Show up level and score |
| Test Description | Verify level and score are displayed on a big display when FPGA board's switch 2 is pressed. |
| Requirement(s) | The game is started, menu is opened |
| Step(s) | 1. Start the game, <br> 2. Open menu, <br> 3. Press Switch 2. |
| Expected Result | A display with score and level is showed. |
| Priority |🟢|
|Test result||

### 29. Change FroggyRanck's appearance

| ID | T29 |
| --- | --- |
| Name | Change FroggyRanck's appearance |
| Test Description | Verify FroggyRanck could change appearance with a display of sprite when FPGA board's switch 3 is pressed. |
| Requirement(s) | The game is started, menu is opened |
| Step(s) | 1. Start the game, <br> 2. Open menu, <br> 3. Press switch 3.|
| Expected Result | A display with FroggyRanck's appearance is showed with possibility to selec one of them. |
| Priority |🟢|
|Test result||

### 30. Display a register of bonuses

| ID | T30 |
| --- | --- |
| Name | Display a register of bonuses |
| Test Description | Verify a display with different bonuses and explication is displayed when FPGA board's switch 4 is pressed. |
| Requirement(s) | The game is started, Menu is oppened |
| Step(s) | 1. Start the game, <br> 2. Open Menu, <br> 3. Press switch 4. |
| Expected Result | A display with a register of bonuses and description of them next to sprit. |
| Priority | 🟢|
|Test result||
