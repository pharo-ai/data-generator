Class {
	#name : 'AICirclesGeneratorTest',
	#superclass : 'AISampleGeneratorTest',
	#category : 'AI-DataGenerator-Tests',
	#package : 'AI-DataGenerator-Tests'
}

{ #category : 'accessing' }
AICirclesGeneratorTest >> generateSample: numberOfSamples [

	^ self generator generateCircles: numberOfSamples
]

{ #category : 'accessing' }
AICirclesGeneratorTest >> generator [

	^ generator ifNil: [ generator := AICirclesGenerator new ]
]

{ #category : 'tests' }
AICirclesGeneratorTest >> testInitialize [

	super testInitialize.
	self assert: generator start equals: 0.
	self assert: generator stop equals: 2 * Float pi.
	self assert: generator factor equals: 0.8
]
