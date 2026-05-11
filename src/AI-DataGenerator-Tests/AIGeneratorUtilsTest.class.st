Class {
	#name : 'AIGeneratorUtilsTest',
	#superclass : 'TestCase',
	#instVars : [
		'utils'
	],
	#category : 'AI-DataGenerator-Tests',
	#package : 'AI-DataGenerator-Tests'
}

{ #category : 'running' }
AIGeneratorUtilsTest >> setUp [

	super setUp.
	utils := AIGeneratorUtils new.
	utils pseudoRandomNumberGenerator: (utils defaultPseudoRandomNumberGeneratorWithSeed: 42).
]

{ #category : 'tests' }
AIGeneratorUtilsTest >> testApplyNoiseOn [

	| actual expected |
	actual := utils applyNoise: 0.05 on: (1 to: 10).
	expected := { 1.0448204366263738. 1.9549376015629534. 2.975492236352245. 3.93986432367312. 5.022155684095713. 6.000573505146629.
	            7.010511476516221. 7.916147764055108. 9.046002901673694. 9.994490446240395 }.

	self assert: actual equals: expected
]

{ #category : 'tests' }
AIGeneratorUtilsTest >> testLinspaceDoesIncludeStop [

	| linspace |
	linspace := utils
		            linspace: 1
		            stop: 10
		            numberOfPoints: 10
		            includeStop: true.

	self assert: linspace equals: (1 to: 10)
]

{ #category : 'tests' }
AIGeneratorUtilsTest >> testLinspaceDoesNotIncludeStop [

	| linspace |
	linspace := utils
		            linspace: 1
		            stop: 10
		            numberOfPoints: 9
		            includeStop: false.

	self assert: linspace equals: (1 to: 9)
]

{ #category : 'tests' }
AIGeneratorUtilsTest >> testLinspaceWithFloatStep [

	| linspace |
	linspace := utils
		            linspace: 0
		            stop: 1
		            numberOfPoints: 101
		            includeStop: true.

	self assert: linspace closeTo: (0 to: 1 by: 0.01) precision: 1e-8
]
