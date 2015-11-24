[![Build Status](http://img.shields.io/travis/pikesley/dead-cockroach.svg?style=flat-square)](https://travis-ci.org/pikesley/dead-cockroach)
[![Dependency Status](http://img.shields.io/gemnasium/pikesley/dead-cockroach.svg?style=flat-square)](https://gemnasium.com/pikesley/dead-cockroach)
[![Coverage Status](http://img.shields.io/coveralls/pikesley/dead-cockroach.svg?style=flat-square)](https://coveralls.io/r/pikesley/dead-cockroach)
[![Code Climate](http://img.shields.io/codeclimate/github/pikesley/dead-cockroach.svg?style=flat-square)](https://codeclimate.com/github/pikesley/dead-cockroach)
[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://pikesley.mit-license.org)
[![Badges](http://img.shields.io/:badges-6/6-ff6799.svg?style=flat-square)](https://github.com/badges/badgerbadgerbadger)

#Dead Cockroach

##Convert [Uncle-Clive](http://uncleclive.herokuapp.com/)'s JSON into something suitable for [Pokrovsky](http://pokrovsky.herokuapp.com/)'s Github vandalism

_v0.0.1_

##Introduction

A very simple webservice to take the 8-unit-high output from [Uncle-Clive](http://uncleclive.herokuapp.com/) and convert it to 7 units for use in the [Pokrovsky](http://pokrovsky.herokuapp.com/) Github vandalism service, according to the following rules:

* if a character has a blank top row, that row will be excised, else
* if a character has a blank bottom row, that row will be excised, else
* _rows[4]_ will be excised

###API

####`/:text`

Will return JSON content representing _:text_, rendered in the 1982 Sinclair Spectrum character set, but compressed into 7 rows, and with the 'on' pixels represented by 4s.
