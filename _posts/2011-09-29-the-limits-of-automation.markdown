---
layout: default
title: the limits of automation
tags:
- testing
- limits
- automation
- practical
- technological
- useful
published: yes
---
Automation testing is frequently evangelised as the cure-all of software quality woes. However automated testing has limits on its effectiveness. Understanding these limits will keep us from trying to automate something that should never be.

### Scoping Limitations
In an automated test, deviations from the norm are not necessarily reported as failures. We can work around that by writing more tests, each of them focusing on one factor of the system.

**Practical Limitations**: automation comes with a maintenance cost as the product evolves. This places practicality limits around what we automate. It’s not feasible to automate everything, as we must maintain everything. We need to be prudent about what tests we want to keep.

**Technological Limitations**: some testing activities are just not possible to automate, like user experience testing. As soon as we move into the area where subjective qualities are being measured automation breaks down.

**Usefulness Limitations**: automated tests do not provide equal value to the team. The high use post-deploy smoke test is more valuable than checking whether the user name field supports “Travis” as well as “Cornelius”. Just like we risk and value assess our manual testing effort we should be doing the same with automation.

### Conflicting Limitations
The limitations we touched on they fall into two categories; those that force us to be smarter about the small set of tests we automate and those that drive us to want more tests. We can’t have both. How we deal with this is what makes a good tester.