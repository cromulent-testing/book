---
layout: default
title: what we do in the case of an automation backlog?
tags:
- automation
- backlog
- lean
- work in progress
- WIP
- kanban
- test driven development
- TDD
published: yes
---
The behaviour people have when they are behind is often more damaging then being behind. We're going to focus on a couple of ways we can climb out of this hole.

Firstly, get the team to help us catch up!

Moving the culture to a test driven approach will fix the backlog and prevent it from happening. As changing culture can be long term, we can use [WIP](http://leanandkanban.wordpress.com/2009/05/14/wip-and-limits/) (Work In Progress) limits; an easily implemented tool from Lean, to make the team aware of the problem and to move in the right direction.

For example, once the tester's WIP limit is reached, before anyone can start more work, they need to help the tester finish something. Get the team to stop starting and to start finishing. Optimizing the team as a whole increases work flow more than optimizing individual components.

The second tactic is damage control, and will stop us chasing our tails until the end of time. This approach assumes a team that is unwilling/unable to support the testers. For new work, we prioritise based on risk; covering the low priority work with mostly manual testing to stop the backlog from growing. To deal with the existing backlog, we write smoke tests to give us thin coverage and confidence over the functionality,  filling in the gaps based on priority, balanced with the new work coming in.

More on information on WIP limits: [http://leanandkanban.wordpress.com/2009/05/14/wip-and-limits/](http://leanandkanban.wordpress.com/2009/05/14/wip-and-limits/)