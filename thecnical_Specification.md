# 2023-2024 - FROGGYRANCK PROJECT - FPGA GAME - TEAM 1

## Role Distribution for the Project

| Photo | Name | Role | Contact |
|---|---|---|---|
| ![Grégory PAGNOUX](https://ca.slack-edge.com/T07NMGKN89J-U07NG76JG21-c0a56378ea45-512) | Grégory PAGNOUX | Project Manager | [GitHub](https://github.com/Gregory-Pagnoux) \| [LinkedIn](https://www.linkedin.com/in/grégory-pagnoux-313b3a251/) \| [Email](mailto:gregory.pagnoux@algosup.com) |
| ![Lena DE GERMAIN](https://ca.slack-edge.com/T019N8PRR7W-U07DQ644220-32f6fb88c2d8-192) | Lena DE GERMAIN | Program Manager | [GitHub](https://github.com/lenadg18) \| [LinkedIn](https://www.linkedin.com/in/lena-degermain-5535a032a/) \| [Email](mailto:lena.degermain@algosup.com) |
| ![Mathis LEBEL](https://ca.slack-edge.com/T07NMGKN89J-U07NJUJGP19-g3711fcc3b4b-512) | Mathis LEBEL | Technical Lead | [GitHub](https://github.com/mathislebel) \| [LinkedIn](https://www.linkedin.com/in/mathis-lebel-429114293/) \| [Email](mailto:mathis.lebel@algosup.com) |
| ![Robin GOUMY](https://ca.slack-edge.com/T019N8PRR7W-U07EAF600RE-712036a7e97f-512) | Robin GOUMY | Software Engineer | [GitHub](https://github.com/RobinGOUMY) \| [LinkedIn](https://www.linkedin.com/in/robin-goumy-66452832a/) \| [Email](mailto:robin.goumy@algosup.com) |
| ![Alexis SANTOS](https://ca.slack-edge.com/T07NMGKN89J-U07NCGVBHGE-9217f9ed5380-512) | Alexis SANTOS | Quality Assurance | [GitHub](https://github.com/Mamoru-fr) \| [LinkedIn](https://www.linkedin.com/in/alexis-santos-83481031b/) \| [Email](mailto:alexis.santos@algosup.com) |
| ![Yann-Maël BOUTON](https://ca.slack-edge.com/T019N8PRR7W-U07EAF5MLU8-cbf39e86ee82-512) | Yann-Maël BOUTON | Technical Writer | [GitHub](https://github.com/devnjoyer) \| [Email](mailto:yann-mael.bouton@algosup.com) |

---

## Technical Specifications

![-](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/aqua.png)

<details>
<summary>📖 Table of Contents</summary>

- [I. Project Introduction](#i-project-introduction)
  - [A. Client](#a-client)
  - [B. Project Objective](#b-project-objective)
- [II. Solution](#ii-solution)
  - [A. Description](#a-description)
  - [B. Components](#b-components)
    - [1. Frog (Player)](#1-frog-player)
    - [2. Cars (Obstacles)](#2-cars-obstacles)
    - [3. Level System](#3-level-system)
    - [4. 7-Segment Display](#4-7-segment-display)
  - [C. Display](#c-display)
  - [D. Constraints](#d-constraints)
  - [E. Risks and Assumptions](#e-risks-and-assumptions)
- [III. Technical Specifications](#iii-technical-specifications)
  - [A. Graphic Convention](#a-graphic-convention)
  - [B. Writing Convention](#b-writing-convention)
  - [C. File Architecture](#c-file-architecture)
  - [D. Implementation](#d-implementation)
- [IV. Additional Considerations](#iv-additional-considerations)
  - [A. Cost Estimate](#a-cost-estimate)
  - [B. Performance](#b-performance)
  - [C. Security](#c-security)
    - [1. Data Security](#1-data-security)
- [V. Success Evaluation](#v-success-evaluation)

</details>

![-](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/aqua.png)

| | |
| - | - |
| Author(s) | Mathis LEBEL |
| Reviewer(s) | Alexis SANTOS |
| Created on | 10/07/2024 |
| Last updated | 10/14/2024 |

![-](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/aqua.png)

### I. Project Introduction

- **A. Client**
  - The **FroggyRanck** project is a reimagining of the arcade game **Frogger** on an **FPGA** board.
  - Developed to provide a retro gaming experience with custom features.
  - Aimed at a playful and educational audience.

- **B. Project Objective**
  - To recreate a game on FPGA where the player controls a frog that must cross a road filled with cars to reach its destination.
  - Includes VGA display mechanisms and hardware controls (buttons on the board).

### II. Solution

- **A. Description**
  - Developed in **Verilog** on the **[FPGA board name]**.
  - Display managed via VGA, with the player using the board's buttons to move the frog.
  - Each level becomes progressively more difficult with an increase in the number of obstacles.

- **B. Components**
  - **1. Frog (Player)**
    - Controlled using the directional buttons on the FPGA board.
    - Frog sprite displayed on the VGA screen.
  
  - **2. Cars (Obstacles)**
    - Randomly generated cars moving horizontally.
    - Variable speed of cars to increase difficulty.
  
  - **3. Level System**
    - Gradual increase in car speed at each level.
    - The player earns a point for each successful crossing.
  
  - **4. 7-Segment Display**
    - Player's score displayed on the **7-segment display** of the FPGA board.

- **C. Display**
  - Game displayed on a **VGA** screen connected to the FPGA board, with a resolution of 640x480 pixels.

- **D. Constraints**
  - Real-time operation with no noticeable latency.
  - Managing button bounces via a Verilog filter.
  - VGA display limited to 640x480 with 256 colors.

- **E. Risks and Assumptions**
  - **Development Time**: Delivery within a tight timeline; non-essential features may be set aside for a future version.
  - **Performance Risk**: Importance of hardware management for a good user experience.
  - **Compatibility**: Game must be compatible with the specified FPGA board.

### III. Technical Specifications

- **A. Graphic Convention**
  - **Background**: Black color (#000000).
  - **Frog**: 16x16 pixel sprite, green (#00FF00).
  - **Cars**: 16x32 pixel sprites, color varying by level.

- **B. Writing Convention**
  - Verilog conventions:
    - **UpperCamelCase** for modules (e.g., `FrogPlayer`).
    - **snake_case** for signals (e.g., `frog_position`).
    - Comments in **English**, starting with a capital letter and punctuation.

- **C. File Architecture**
  - Code organized into the following directories:
    - `src/`: Verilog source code.
    - `test/`: Unit tests.
    - `docs/`: Documentation.

- **D. Implementation**
  - Implementation steps:
    - Prototyping the base game.
    - Integrating components (frog, cars, display).
    - Testing and debugging features.
  
### IV. Additional Considerations

- **A. Cost Estimate**
  - Total estimated cost: **[insert cost]**.
  - Budget for hardware, tools, and miscellaneous expenses.

- **B. Performance**
  - Aim for **60 FPS** for optimal fluidity.
  - Regular performance testing throughout development.

- **C. Security**
  - **1. Data Security**
    - Protecting user data (if applicable) via secure storage methods.

### V. Success Evaluation
- Success measured by:
  - User feedback after deployment.
  - Adherence to deadlines and performance objectives.
  - Reduction of bugs detected during testing.
