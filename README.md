# Synthetic Dataset Generator

[![Build status](https://github.com/pharo-ai/data-generator/workflows/CI/badge.svg)](https://github.com/pharo-ai/data-generator/actions/workflows/test.yml)
[![Coverage Status](https://coveralls.io/repos/github/pharo-ai/data-generator/badge.svg?branch=master)](https://coveralls.io/github/pharo-ai/data-generator?branch=master)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/pharo-ai/data-generator/master/LICENSE)

## How to install it

To install `data-generator`, go to the Playground (Ctrl+OW) in your [Pharo](https://pharo.org/) image and execute the following Metacello script (select it and press Do-it button or Ctrl+D):

```Smalltalk
Metacello new
  baseline: 'AIDataGenerator';
  repository: 'github://pharo-ai/data-generator';
  load.
```

## How to depend on it

If you want to add a dependency on `data-generator` to your project, include the following lines into your baseline method:

```Smalltalk
spec
  baseline: 'AIDataGenerator'
  with: [ spec repository: 'github://pharo-ai/data-generator' ].
```

## How to use it

```st
generator := AIDataGenerator new.
data := generator generateRows: 100 columns: 10.
```

## Idea for the future

```st
generator := AIDataGenerator new.

generator
    addIntegerColumnNamed: 'weight'
    inRangeBetween: 40
    and: 100
    distributedUsing: PMNormalDistribution new.

generator
    addFloatColumnNamed: 'salary'
    inRangeBetween: 1000
    and: 5000
    distributedUsing: (PMExponentialDistribution mu: 2000 sigma: 0.5).

generator
    addCategoricalColumnNamed: 'gender'
    withValues: #(male female)
    distributedUsing: PMUniformDistribution new.

dataFrame := generator generateDatasetWithRows: 10000.
```
