---
layout: default
title: Mule Specs - automated assumption testing
tags:
- testing
- assumptions
- rpsec
- mule spec
- sequel
- ruby
- mule testing
published: yes
---
In our last post we talked about [mule testing](http://cromulent-testing.com/2011/08/25/mule-testing-proactively-testing-assumptions.html). Assumptions need automation because they’re the foundation our systems are built upon; they can change at anytime. Mule specs are a way to automate mule tests.

You can use any automated testing tool - the one your project already uses is probably fine. Unless it’s QTP. Below is the example from the [last post](http://cromulent-testing.com/2011/08/25/mule-testing-proactively-testing-assumptions.html) in RSpec using the sequel gem.

{% highlight ruby %}
describe 'products' do
  it 'do not require a category' do
    sql = <<-SQL
      SELECT count(1) as row_count
      FROM product
      WHERE category IS NULL
    SQL

    at_least_one_row_exists sql
  end
end
{% endhighlight %}

We use two helper functions as we phrase our tests to expect either at least one result or no results.

{% highlight ruby %}
def at_least_one_row_exists sql
  DB[sql][:row_count].should != 0
end

def no_rows_exists sql
  DB[sql][:row_count].should == 0
end
{% endhighlight %}

### Getting production data
Mule tests require prod data, the older and less realistic it is, the less certainty you have in your assumptions. Running Mule Specs on production data doesn’t mean running them on production, that’s a really bad idea. Copy the data elsewhere before execution. We arranged a sync from production every night and our Mule Specs run against it. So, when we arrive in the morning we know that as of yesterday, all our assumptions are still true.

Mule specs give us more than just a way of verifying assumptions. Written well, with good reporting, you produce verified documentation that’s updated every night when the mules run. Get the entire team involved. Ensure the analysts note their assumptions as they go and have the testers and developers implement them.

Follow your heart, run with the mules every night.