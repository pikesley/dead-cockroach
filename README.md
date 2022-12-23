# [Dead Cockroach](https://www.crashonline.org.uk/79/sinclair.htm)

## Convert [Uncle-Clive](//github.com/pikesley/uncle-clive)'s JSON into something suitable for [Pokrovsky](//github.com/pikesley/pokrovsky)'s Github vandalism

_v0.0.1_

## Introduction

A very simple webservice to take the 8-unit-high output from [Uncle-Clive](//github.com/pikesley/uncle-clive) and convert it to 7 units for use in the [Pokrovsky](/github.com/pikesley/pokrovsky) Github vandalism tool, according to the following rules:

* if a character has a blank top row, that row will be excised, else
* if a character has a blank bottom row, that row will be excised, else
* _rows[4]_ will be excised

### API

#### `/:text`

Will return JSON content representing _:text_, rendered in the 1982 Sinclair Spectrum character set, but compressed into 7 rows, and with the 'on' pixels represented by 4s.
