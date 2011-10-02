---
layout: default
title: Disposable Automation
tags:
- automation
- disposable automation
- technical debt
- record & playback
- exploratory testing
- exploratory automation
published: yes
---
In our experience, testers have an unhealthy attachment to automated tests. We’re going to talk about times when throwaway automation is really helpful.

### Record and playback
Sick and tired of clicking through page after page to find what you want to test? Record your path, run it, and test what actually matters. Record and playback is quick and easy. The code it creates will make your eyes bleed which doesn’t matter as long you dump it as soon as you’re done with it.

### Exploratory Automation
Sometimes you need to test things that can’t easily be done manually. We were exploring a bug lurking deep within a server and found ourselves manually crafting HTTP headers in telnet. We realised it’s a lot easier to do this in code. So we did. We found the bug and threw the automation away.

### Permutations and Combinations
There’s an adage that you can’t test everything. Sometimes, your tester senses tell you to cover a part of the system thoroughly. This can be done with a script that generates the various combinations. Run it over night and don’t leave your number.

Automation you decide to keep, you decide to maintain and “The things you own, end up owning you.” Tyler Durden