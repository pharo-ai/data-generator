Class {
	#name : 'AIGeneratorUtils',
	#superclass : 'Object',
	#category : 'AI-DataGenerator',
	#package : 'AI-DataGenerator'
}

{ #category : 'accessing' }
AIGeneratorUtils >> applyNoise: noise on: aCollection [

	| gaussian |
	gaussian := PMGaussianGenerator new standardDeviation: noise.
	^ aCollection collect: [ :each | each + gaussian next ]
]

{ #category : 'accessing' }
AIGeneratorUtils >> linspace: startInteger stop: stopInteger numberOfPoints: aNumber [

	^ self
		  linspace: startInteger
		  stop: stopInteger
		  numberOfPoints: aNumber
		  endpoint: true
]

{ #category : 'accessing' }
AIGeneratorUtils >> linspace: startInteger stop: stopInteger numberOfPoints: aNumber endpoint: aBoolean [

	| div delta step y |
	div := aBoolean
		       ifTrue: [ aNumber - 1 ]
		       ifFalse: [ aNumber ].
	delta := stopInteger - startInteger.
	step := delta / div.
	y := 0 to: aNumber - 1.
	y := y * step.
	y := y + startInteger.

	aBoolean & (aNumber > 1) ifTrue: [ y atLast: 1 put: stopInteger ].

	^ y
]
