## Test Plan

| Author       | Alexis SANTOS |
|--------------|---------------|
|Created       |   9/26/2024   |
|Last Modified |   10/09/2024  |

<details>

<summary> Table of content </summary>

- [Test Plan](#test-plan)
- [I. Introduction](#i-introduction)
  - [Document purpose](#document-purpose)
- [II. Quality Objectives](#ii-quality-objectives)
  - [A. Primary objectives](#a-primary-objectives)
  - [B. Secondary Objectives](#b-secondary-objectives)
- [III. Scope of Testing](#iii-scope-of-testing)
  - [A. Scope of Frogger's Software](#a-scope-of-froggers-software)
  - [B. Scope of Frogger's Hardware](#b-scope-of-froggers-hardware)
  - [C. Scope of documentation](#c-scope-of-documentation)
  - [D. Out of Scope for Testing](#d-out-of-scope-for-testing)
- [IV. Testing Strategy](#iv-testing-strategy)
  - [A. Unit test](#a-unit-test)
  - [B. Test Structure](#b-test-structure)
  - [C. Test List](#c-test-list)
    - [1. Handling](#1-handling)
    - [2. Game Dynamics](#2-game-dynamics)
    - [3. Scoring \& Level Indicator Mekanisms](#3-scoring--level-indicator-mekanisms)
    - [4. Menu Mekanisms](#4-menu-mekanisms)
    - [5. Bonus Mekanisms](#5-bonus-mekanisms)
- [V. Glossary](#v-glossary)

</details>

## I. Introduction

The project aims to develop a faithful recreation of the arcade game Frogger using the Verilog[^2] on hardware supplied by Nandland.com, an FPGA / Go-board[^1]. The main objective is to offer an experience that captures the essence of Frogger's original gameplay while adding features that enhance the user experience.

The project is aimed at a varied audience, from those familiar with the original Frogger game or its various copies to those discovering it for the first time. With a dual objective, the product aims to serve as a pedagogical tool for learning to code in the Verilog language and as an entertainment game.

Before creating the game and testing it, we need to understand how worked this game. Frogger is basically a game about controlling a frog who has to return home. 

<p class="text-center"> <img src="/images/Frogger_Original_Game.jpg" alt="Original Frogger"> </p>

To do this, as in the picture above, the frog must cross a busy road, and then an equally busy river. The frog, must dodge the various cars to stay alive, jump on logs and turtle shells that can dive underwater to cross the river, and reach his goal of returning home.


### Document purpose

This document has been created to facilitate communication between team members on the various tests to be carried out on the project. It describes the approaches and methodologies that will be applied to Frogger's regression[^3], smoke[^4], Functionnal[^5], Unit[^6] tests and test case[^7]. It also identifies the Frogger's reactions to the various tests.

---

## II. Quality Objectives

### A. Primary objectives

Testing the Frogger game program must validate, from the requirements point of view, that :

* One of the backgrounds must match or represent the original Frogger with the road and river.
* Have a main character who functions in the same way as the original Frogger: moving from square to square on the 20x15 grid.
* Have obstacles, like the cars in the original Frogger, which move square by square on the 20x15 grid.
* Reset the game using all four switches simultaneously.
* Have a level system that corresponds to the number of levels completed

### B. Secondary Objectives

As we are also implementing a number of additional functionalities, we also need to test whether these functionalities work correctly and whether they do not negatively impact the objectives already in place. Consequently, this test plan will also focus on the following aspects:

* Use sprites for main characters and obstacles in 32x32 (VGA screen is 640x480, 640/20 = 32 and 480/15 = 32).
* Add a winning page which appears when all levels are finish.
* Add a menu that allows to :
  * Save the game
  * Possibility to change Frog's appearence
  * Display the score and current level compared to existing levels.
* Add levels with specific frog and obstacle appearances, like : 
  * Halloween theme
  * Christmas theme
  * ALGOSUP theme

---

## III. Scope of Testing

Testing will focus on both core gameplay elements and peripheral features to guarantee a reliable end product. However, it's important to note that certain aspects, such as low-level technical details will be excluded from testing as they are beyond the scope of the test.

### A. Scope of Frogger's Software

As far as software testing is concerned, we will test everything we can:
* Absence of significant bugs
* Main game mechanics and functionality
* Additional game mechanics and features
* Acceptable visual quality
* Sprite speed
* Sprites and graphics quality

### B. Scope of Frogger's Hardware

As far as hardware testing is concerned, we will test everything we can, such as :
* Switch use and responsiveness
* The correspondence between the 7 segments displaying the current level number and the true level number

### C. Scope of documentation

The documents are supposed to explain their purpose and add value to the project. Thus, we will test the documents on : 
* Spelling accuracy
* Vocabulary accuracy
* Information provided in relation to its usefulness

### D. Out of Scope for Testing

Some parts do not require a test to exist in the project, such as :
* Font details
* Colors of sprites

## IV. Testing Strategy

Our testing strategy uses a multi-faceted approach. Unit testing forms the basis, scrutinizing individual components to verify their functionality. Game testing sessions take center stage, offering a holistic evaluation of gameplay, user interactions, and the overall user experience.

### A. Unit test

Unit testing is an important part of the process. These tests are developed in Verilog and executed on an FPGA / Go-board, to meet the customer's requirements.

These tests are developed throughout the project, in parallel with the development of the game, which corresponds to an exploratory testing approach.

These unit tests meet three crucial objectives:
* Code functionality: check that each function works as expected in different scenarios. For example, we make sure that the scoring mechanisms work correctly when Frogger interacts with different elements such as obstacles or bonuses.
* Code quality: Evaluate code clarity and quality to promote maintainability and ease of collaboration between developers.
* Code coverage: Guarantee comprehensive testing to prevent future modifications from unintentionally altering the code's original behavior.

### B. Test Structure

Each test comprises the following components:

* Function: Identifies the function under examination.
* Test Description: Describes the purpose of the test, the specific conditions being evaluated, and the expected outcome.
* Severity: Indicates the criticality of the test, categorized as High, Medium, or Low.

### C. Test List

#### 1. Handling

|Fonction|Test Description| Severity|
|:-|:-:|:-:|
|Foward square by square|Press SW1|High|
|Backward square by square |Press SW2|High|
|Right square by square |Press SW3|High|
|Left square by square|Press SW4|High|
|Reset the game|Press SW1 & SW2 & SW3 & SW4|High|

#### 2. Game Dynamics

|Fonction|Test Description| Severity|
|:-|:-:|:-:|
|Wall Collision (Frogger)|Ensure Frogger stops at every screen edge|High|
| Frogger / Car collision| Ensures Frogger stops every collision with an obstacle | High |
| Lives cap | Player can't have more than 5 lives | Medium |
| Lives cap | Player can't have less than 0 lives | Medium |

#### 3. Scoring & Level Indicator Mekanisms

|Fonction|Test Description| Severity|
|:-|:-:|:-:|
|Score when Finish a Level|Increment 100 Points|Medium| 
|Score when hit a obstacle|Reset Score|Medium|
|Score when take a gift|Increment 20 Points|Low|
|Score when take a poison gift|Decrement 20 Points|Low|

#### 4. Menu Mekanisms

|Fonction|Test Description| Severity|
|:-|:-:|:-:|
|Open & Close Menu|Press SW1 & SW2|Medium|
|Save Button|Press SW1|Medium|
|Show up the Level & Score|Press SW2|Low|
|Possibility to change Frog's appearance|Press SW3|Low|
|Have a Register of Different Bonuses|Press SW4|Low|

#### 5. Bonus Mekanisms

|Fonction|Test Description| Severity|
|:-|:-:|:-:|
|Take Gift|increase your score by 20 points| Low |
|Take Poison Gift|reduce the score by 20 points| Low|
|Take a StopTime Bonus|stop the obstacle for 3 seconds| Low |
|Take a Level Rebooter|return to start of level|Low |
|Take a Star|make the character invincible for 3 seconds| Low |
|Take a Left arrow|slows down obsctacles| Low |
|Take a Right arrow|speed up obsctacles| Low |

---

## V. Glossary

[^1]: FPGA board / Go-board
Field Programmable Gate Arrays (FPGAs) are integrated circuits used to program and launch games.
Source : <a href="https://www.arm.com/glossary/fpga#:~:text=Field%20Programmable%20Gate%20Arrays%20(FPGAs,requirements%20after%20the%20manufacturing%20process.">arm</a>

[^2]: Verilog
Verilog is a hardware description language used for computer simulation and synthesis. This is what we used to code the FPGA board.
Source : [ScienceDirect](https://www.sciencedirect.com/topics/computer-science/verilog#:~:text=Verilog%20is%20a%20hardware%20description,language%20constructs%20for%20logic%20synthesis.)

[^3]: Regression test
A regression test is a check to ensure that recent changes to a software application haven't negatively impacted its existing functionalities. It helps catch unintended side effects or "regressions" that might occur when new features or updates are added.

[^4]: Smoke test
A smoke test is a quick and basic check or test performed to verify that it works on a fundamental level. A smoke test ensures that the main functionalities of a program or system are operational without delving into detailed or exhaustive testing.

[^5]: Functional test
Functional testing is a process categorized as black-box testing. It constructs test cases based on the specified requirements of the software component under examination.

[^6]: Unit test
A unit test is a specific kind of testing conducted by developers on isolated components (units) of a software program. Developers create and execute unit tests to verify the correctness of individual functions or methods within the code. 

[^7]: Test case
A "test case" is a specific set of instructions or conditions that are designed to determine whether a software application, system, or component functions correctly under certain circumstances. It's a detailed scenario or situation used to verify that the software behaves as expected. 
