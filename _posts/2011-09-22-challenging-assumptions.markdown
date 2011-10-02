---
layout: default
title: challenging assumptions
tags:
- testing
- assumptions
- listening
- details
- averages
- months
- rounding
published: yes
---
Many bugs can be prevented by challenging assumptions. Challenging the assumptions every one holds as well as paying attention to the seemingly small ones, will yield great results.

Small things can be the most dangerous as they tend to go unnoticed, then gang up on you. It’s more common for projects to get overwhelmed by a build up of small things. The devil’s in the detail.

To find assumptions, listen to the way people speak. Assumptions can found in sentences that contain:
 -  must,  always, mandatory, required
 -  impossible, inconceivable, never
 -  should, ought
 -  doesn’t make sense

 <br />
*Doesn’t make sense is a favourite.* This planet is filled with humans who do many things that make more money than sense.

### An Example!
Consider the following story:

*As a customer*  <br />
*I want to know the average activity*  <br />
*So that I can compare this month’s activity against the average*  <br />

Sounds simple... but if you look a little deeper:

 -  What do we mean by ‘know’?
 -  What do we mean by average? [Geometric](http://en.wikipedia.org/wiki/Geometric_mean), [harmonic](http://en.wikipedia.org/wiki/Harmonic_mean) or [arithmetic mean](http://en.wikipedia.org/wiki/Arithmetic_mean)?
 -  What activity?
 -  What do you mean by month? [How many days are in it?](http://en.wikipedia.org/wiki/Month#Months_in_various_calendars)
 -  Over what time span is the average calculated? Does it [move](http://en.wikipedia.org/wiki/Moving_average)?
 -  How are the numbers rounded? How is the [tie broken](http://en.wikipedia.org/wiki/Rounding#Tie-breaking)?

Remember, the most hidden assumptions are those you yourself hold. As a tester, you need to challenge yourself and question everything.