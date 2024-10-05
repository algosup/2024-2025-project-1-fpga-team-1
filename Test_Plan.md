## Test Plan

| Author       | Alexis SANTOS |
|--------------|---------------|
|Created       |   9/26/2024   |
|Last Modified |   10/05/2024  |


<details>

<summary> Table of content </summary>

- [Test Plan](#test-plan)
- [I. Introduction](#i-introduction)
  - [A. Document purpose](#a-document-purpose)
- [II. Quality Objectives](#ii-quality-objectives)
  - [A. Primary objectives](#a-primary-objectives)
  - [B. Secondary Objectives](#b-secondary-objectives)
- [III. Scope of Testing](#iii-scope-of-testing)
  - [A. Scope of Frogger's Software](#a-scope-of-froggers-software)
  - [B. Scope of Frogger's Hardware](#b-scope-of-froggers-hardware)
  - [C. Scope of documentation](#c-scope-of-documentation)
- [IV. Testing Strategy](#iv-testing-strategy)
  - [A.](#a)
- [X. Glossary](#x-glossary)

</details>



## I. Introduction

The client contacted us to work on a new version of Frogger, an arcade game. This game targets nostalgics of the arcade era, those who are fans of the Frogger concept, as well as those who want to (re)discover arcade games.

Frogger is basically a game about controlling a frog who has to return home. 

<p class="text-center"> <img src="/images/Frogger_Original_Game.jpg" alt="Original Frogger"> </p>

To do this, as in the picture above, the frog must cross a busy road, then an equally busy river. The frog, Frogger, must dodge the various cars to stay alive, jump on logs and turtle shells that can dive underwater to cross the river and reach his goal of returning home.

The aim of this project is to recreate the arcade game Frogger using hardware supplied by Nandland.com, an FPGA / Go-board[^1] coded in Verilog[^2]. 

With these objectives in mind, the product aims to serve as a pedagogical tool for learning Verilog. As well as (re)discovering the arcade games of yesteryear.

### A. Document purpose

This document has been created to facilitate communication between team members on the various tests to be carried out on the project. It describes the approaches and methodologies that will be applied to Frogger's regression[^3], smoke[^4], Functionnal[^5], Unit[^6] tests and test case[^7]. It also identifies the Frogger's reactions to the various tests.

## II. Quality Objectives

### A. Primary objectives

Testing the Frogger game program must validate, from the requirements point of view, that :
* One of the backgrounds must match or represent the original frogger with the road and river.



### B. Secondary Objectives




## III. Scope of Testing

### A. Scope of Frogger's Software



### B. Scope of Frogger's Hardware



### C. Scope of documentation


## IV. Testing Strategy


### A. 










The strategy that will be used to test the game is to test it manually. The tester will have to test the game throughout the development phase and also afterwards in order to prevent the appearance of bugs and to be able to resolve them if there are any.

First, we'll run a smoke test to see if the basic functionality works. When the smoke test is successful, we will then perform a functional test to ensure all features work as expected. Then we will do a regression test after each new version to see if any new bugs appear...



## X. Glossary

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
