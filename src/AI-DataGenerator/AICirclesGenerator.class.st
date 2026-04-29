Class {
	#name : 'AICirclesGenerator',
	#superclass : 'AISampleGenerator',
	#instVars : [
		'factor'
	],
	#category : 'AI-DataGenerator',
	#package : 'AI-DataGenerator'
}

{ #category : 'accessing' }
AICirclesGenerator >> factor [

	^ factor
]

{ #category : 'accessing' }
AICirclesGenerator >> factor: anObject [

	factor := anObject
]

{ #category : 'generating' }
AICirclesGenerator >> generateCircles: numberOfSamples [

	| numberOfSamplesIn numberOfSamplesOut linspaceOut linspaceIn outerCircleX outerCircleY innerCircleX innerCircleY circlesX circlesY label circles |
	numberOfSamplesIn := numberOfSamples // 2.
	numberOfSamplesOut := numberOfSamples - numberOfSamplesIn.

	linspaceOut := (utils
		                linspace: start
		                stop: stop
		                numberOfPoints: numberOfSamplesOut
		                endpoint: false) asOrderedCollection.
	linspaceIn := (utils
		               linspace: start
		               stop: stop
		               numberOfPoints: numberOfSamplesIn
		               endpoint: false) asOrderedCollection.

	outerCircleX := linspaceOut cos.
	outerCircleY := linspaceOut sin.
	innerCircleX := linspaceIn cos * factor.
	innerCircleY := linspaceIn sin * factor.

	circlesX := outerCircleX
		            addAll: innerCircleX;
		            yourself.
	circlesY := outerCircleY
		            addAll: innerCircleY;
		            yourself.

	label := (PMVector zeros: numberOfSamplesOut) asOrderedCollection
		         addAll: (PMVector ones: numberOfSamplesIn);
		         yourself.

	noise ifNotNil: [
			circlesX := utils applyNoise: noise on: circlesX.
			circlesY := utils applyNoise: noise on: circlesY ].

	circles := DataFrame withColumns: {
			           circlesX.
			           circlesY.
			           label }.

	shuffling ifTrue: [ circles shuffleBy: random ].

	^ circles
]

{ #category : 'initialization' }
AICirclesGenerator >> initialize [

	super initialize.
	start := 0.
	stop := 2 * Float pi.
	factor := 0.8
]
