---
layout: default
title: automated testing spec
tags:
- testing
- rpsec
- automation
- team
- asset
- maintanable
- js=>true
published: no
---
{% highlight ruby %}
require 'cromulent_testing'

describe 'automated testing,' do
  describe 'to involve the whole team' do
    it 'should make it easy for the team to contribute'
    it 'should include everyone in defining specifications'
    it 'should support the developers'
    it 'should be in the same language as the code'
  end

  describe 'to be an asset' do
    it 'should make it easier for the product to change'
    it 'should drive the domain model'
    it 'should generate human understandable documentation'
    it 'should cover the boring, repetative work'
    it 'should cover the high risk areas'
  end

  describe 'to be maintenable' do
    it 'should be organised in a way that makes sense'
    it 'should be easy to see why it failed'
    it 'should be discrete'
    it 'should be written as though it were production code'
  end

  describe 'to do it poorly' do
    it 'should be done after the manual testing'
    it 'should be done by a separate team'
    it 'should be done by people who don\'t understand testing'
    it 'should be implemented by people who are not skilled in coding'
    it 'should summon a balrog!'
  end
end
{% endhighlight %}