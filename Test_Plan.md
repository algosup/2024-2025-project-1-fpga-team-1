## Test Plan

| Author       | Alexis SANTOS |
|--------------|---------------|
|Created       |   9/26/2024   |
|Last Modified |   9/26/2024   |


---

<details>

<summary> 📑Table of content </summary>




</details>

---

This is the test plan for our version of Frogger coded in Verilog.

The purpose of these tests is to verify that the game works as expected and is playable. We'll detail how we'll test the game, what type of testing we'll do, and how we'll ensure the game works in the end.

---

### Glossary

| Term | Definition |
|---|---|
| Smoke test | A smoke test is a quick and basic check or test performed to verify that it works on a fundamental level. A smoke test ensures that the main functionalities of a program or system are operational without delving into detailed or exhaustive testing. |
| Functional test | Functional testing is a process categorized as black-box testing. It constructs test cases based on the specified requirements of the software component under examination. |
| Regression test | A regression test is a check to ensure that recent changes to a software application haven't negatively impacted its existing functionalities. It helps catch unintended side effects or "regressions" that might occur when new features or updates are added. |
| Unit test | A unit test is a specific kind of testing conducted by developers on isolated components (units) of a software program. Developers create and execute unit tests to verify the correctness of individual functions or methods within the code. |
| Test case | A "test case" is a specific set of instructions or conditions that are designed to determine whether a software application, system, or component functions correctly under certain circumstances. It's a detailed scenario or situation used to verify that the software behaves as expected. |

---

The strategy that will be used to test the game is to test it manually. The tester will have to test the game throughout the development phase and also afterwards in order to prevent the appearance of bugs and to be able to resolve them if there are any.

First, we'll run a smoke test to see if the basic functionality works. When the smoke test is successful, we will then perform a functional test to ensure all features work as expected. Then we will do a regression test after each new version to see if any new bugs appear..