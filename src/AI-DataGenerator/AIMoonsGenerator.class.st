Class {
	#name : 'AIMoonsGenerator',
	#superclass : 'AICircularSampleGenerator',
	#category : 'AI-DataGenerator',
	#package : 'AI-DataGenerator'
}

{ #category : 'generating' }
AIMoonsGenerator >> generateMoons: numberOfSamples [

	| numberOfSamplesRight numberOfSamplesLeft linspaceRight linspaceLeft rightMoonX rightMoonY leftMoonX leftMoonY moonsX moonsY labels moons |
	numberOfSamplesLeft := numberOfSamples // 2.
	numberOfSamplesRight := numberOfSamples - numberOfSamplesLeft.

	linspaceRight := (utils linspace: start stop: stop numberOfPoints: numberOfSamplesRight) asOrderedCollection.
	linspaceLeft := (utils linspace: start stop: stop numberOfPoints: numberOfSamplesLeft) asOrderedCollection.

	rightMoonX := linspaceRight cos.
	rightMoonY := linspaceRight sin.
	leftMoonX := 1 - linspaceLeft cos.
	leftMoonY := 1 - linspaceLeft sin - 0.5.

	moonsX := rightMoonX
		          addAll: leftMoonX;
		          yourself.
	moonsY := rightMoonY
		          addAll: leftMoonY;
		          yourself.

	labels := (PMVector zeros: numberOfSamplesRight) asOrderedCollection
		          addAll: (PMVector ones: numberOfSamplesLeft);
		          yourself.

	noise ifNotNil: [
			moonsX := utils applyNoise: noise on: moonsX.
			moonsY := utils applyNoise: noise on: moonsY ].

	moons := DataFrame withColumns: {
			         moonsX.
			         moonsY.
			         labels }.

	shuffling ifTrue: [ moons shuffleBy: shuffleRandom ].

	^ moons
]

{ #category : 'initialization' }
AIMoonsGenerator >> initialize [

	super initialize.
	start := 0.
	stop := Float pi
]

{ #category : 'as yet unclassified' }
AIMoonsGenerator >> showMoons: numberOfSamples [

	| moons moonLeft moonRight plotLeft plotRight chart |
	moons := self generateMoons: numberOfSamples.
	moonLeft := moons select: [ :each | (each at: 3) = 1 ].
	moonRight := moons select: [ :each | (each at: 3) = 0 ].
	plotLeft := RSScatterPlot new x: (moonLeft columnAt: 1) values y: (moonLeft columnAt: 2) values.
	plotRight := RSScatterPlot new x: (moonRight columnAt: 1) values y: (moonRight columnAt: 2) values.
	chart := RSCompositeChart new.
	chart
		add: plotLeft;
		add: plotRight.
	chart show.
	^ moons
]
