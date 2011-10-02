---
layout: default
title: when should we be doing automated testing?
tags:
- testing
- automation
- exploratory
- test driven
published: yes
---
Automated tests, that are written **before** the code; capture the intention of the code, inform design decisions, provide rapid feedback and let us know when we are done. All of this gets us thinking about testing and ensuring that our code can be automated.

One view of test automation is to write it **after** the system code has been written so the automation has to cope with less change. We've found this view doesn't hold up in practice, firstly we spend a lot of time reverse engineering the code to automate it. Secondly, if the code is changing then this is when we need test automation the most to provide us with a safety net.

Automated tests that are written **after** the code do not directly inform the design nor do they provide rapid feedback. When writing automated tests in this way we need to ask ourselves; why are we taking this approach?

If we are doing it to provide test coverage or run in the CI build then we are coming to the party late. Without visibility into what automation already exists we could be duplicating test effort. If these tests will help us build a better product then they should be written **before** the code.

If we are using automation to do exploratory testing and we intend to throw the automation code away afterwards then we can write the tests **after**. Not all automation needs to be kept it just has to help us explore.