---
layout: default
title: Mule Testing - proactively testing assumptions
tags:
- testing

published: yes
---
We were building a shiny new system that relied on data from a poorly understood legacy monster. Assumptions about this data were baked into our system. These unchallenged assumptions turned out to be wrong. Our shiny new system was no longer so shiny.

The wider the belief in the assumption, the more it’s en-grained in the business, the greater the need for it to be tested.

Why trust when you can know?

An example Mule test (*it's blogging by example!*)

Start with the assumption: *"All products must have a category"*
Find a way to challenge or validate it. In this case we would run a simple query against production data:

{% highlight sql %}
    SELECT * FROM products WHERE category IS NULL
{% endhighlight %}
    

If the assumption holds true then rest easy. If it turns out to be false, congratulations you have just prevented a major bug. Share it with the team and update your old assumption to include the new facts.
In this example *"A product does not require a category"*.

Mule testing has limits. It only helps you test assumptions that you know about. If the magic combination of data that breaks your assumptions doesn’t yet exist, it won’t fail. It only works with access to the latest production data.

Why the name mule testing? Because some people got the wrong idea when we called it ass testing.