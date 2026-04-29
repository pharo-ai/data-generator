Class {
	#name : 'AIMoonsGenerator',
	#superclass : 'AISampleGenerator',
	#category : 'AI-DataGenerator',
	#package : 'AI-DataGenerator'
}

{ #category : 'generating' }
AIMoonsGenerator >> generateMoons: numberOfSamples [

	| numberOfSamplesRight numberOfSamplesLeft linspaceRight linspaceLeft rightMoonX rightMoonY leftMoonX leftMoonY moonsX moonsY labels moons |
	numberOfSamplesRight := numberOfSamples // 2.
	numberOfSamplesLeft := numberOfSamples - numberOfSamplesRight.

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

	shuffling ifTrue: [ moons shuffleBy: random ].

	^ moons
]

{ #category : 'initialization' }
AIMoonsGenerator >> initialize [

	super initialize.
	start := 0.
	stop := Float pi
]
