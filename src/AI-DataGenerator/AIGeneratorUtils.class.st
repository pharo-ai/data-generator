Class {
	#name : 'AIGeneratorUtils',
	#superclass : 'Object',
	#instVars : [
		'pseudoRandomNumberGenerator'
	],
	#category : 'AI-DataGenerator',
	#package : 'AI-DataGenerator'
}

{ #category : 'accessing' }
AIGeneratorUtils >> applyNoise: noise on: aCollection [

	| gaussian |
	gaussian := PMGaussianGenerator new
		            generator: self pseudoRandomNumberGenerator;
		            standardDeviation: noise.
	^ aCollection collect: [ :each | each + gaussian next ]
]

{ #category : 'accessing - defaults' }
AIGeneratorUtils >> defaultPseudoRandomNumberGenerator [

	^ self defaultPseudoRandomNumberGeneratorWithSeed: Random new seed
]

{ #category : 'accessing - defaults' }
AIGeneratorUtils >> defaultPseudoRandomNumberGeneratorWithSeed: aSeed [

	^ PMParkMillerMinimumRandomGenerator seed: aSeed
]

{ #category : 'accessing' }
AIGeneratorUtils >> linspace: startNumber stop: stopNumber numberOfPoints: aNumber [

	^ self
		  linspace: startNumber
		  stop: stopNumber
		  numberOfPoints: aNumber
		  includeStop: true
]

{ #category : 'accessing' }
AIGeneratorUtils >> linspace: startNumber stop: stopNumber numberOfPoints: aNumber includeStop: aBoolean [
	"If aBoolean is true, the stopNumber will be the last element of the array. If it is false, it will not be included (like an open interval). But in both cases the array will have aNumber elements"

	| div delta step linspace |
	div := aBoolean
		       ifTrue: [ aNumber - 1 ]
		       ifFalse: [ aNumber ].
	delta := stopNumber - startNumber.
	step := delta / div.
	linspace := 0 to: aNumber - 1.
	linspace := linspace * step.
	linspace := linspace + startNumber.

	aBoolean & (aNumber > 1) ifTrue: [ linspace atLast: 1 put: stopNumber ].

	^ linspace
]

{ #category : 'accessing' }
AIGeneratorUtils >> pseudoRandomNumberGenerator [

	^ pseudoRandomNumberGenerator ifNil: [ pseudoRandomNumberGenerator := self defaultPseudoRandomNumberGenerator ]
]

{ #category : 'accessing' }
AIGeneratorUtils >> pseudoRandomNumberGenerator: aPseudoRandomNumberGenerator [

	pseudoRandomNumberGenerator := aPseudoRandomNumberGenerator
]
