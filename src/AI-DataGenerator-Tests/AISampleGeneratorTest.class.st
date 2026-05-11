Class {
	#name : 'AISampleGeneratorTest',
	#superclass : 'TestCase',
	#instVars : [
		'generator'
	],
	#category : 'AI-DataGenerator-Tests',
	#package : 'AI-DataGenerator-Tests'
}

{ #category : 'testing' }
AISampleGeneratorTest class >> isAbstract [

	^ self = AISampleGeneratorTest
]

{ #category : 'accessing' }
AISampleGeneratorTest >> defaultGenerator [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
AISampleGeneratorTest >> generateSample: numberOfSamples [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
AISampleGeneratorTest >> generator [

	^ generator ifNil: [ generator := self defaultGenerator ]
]

{ #category : 'running' }
AISampleGeneratorTest >> setUp [

	super setUp.
	generator := self generator
]

{ #category : 'tests' }
AISampleGeneratorTest >> testInitialize [

	self assert: generator shuffling.
	self assert: generator shuffleRandom class equals: Random.
	self assert: generator utils class equals: AIGeneratorUtils
]
