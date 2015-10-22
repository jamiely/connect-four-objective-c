# Connect Four

[![Build Status](https://travis-ci.org/jamiely/connect-four-objective-c.svg?branch=master)](https://travis-ci.org/jamiely/connect-four-objective-c)

# Intro

Another Connect Four implementation. See my others in Coffeescript and
Scala. This is mostly written to try out a few testing frameworks for
iOS.

# Testing

OCUnit tests are provided. Run them via XCode. 

To run the Frank tests, [follow the instructions on the
site](http://testingwithfrank.com/getting_started.html), including
turning on Accessibility in OS X, and issue the following commands

    bundle install
    bundle exec frank setup # do NOT override env.rb (Select "n")
    bundle exec frank build
    bundle exec cucumber Franke/features

