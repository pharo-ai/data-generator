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
AISampleGeneratorTest >> generateSample: numberOfSamples [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
AISampleGeneratorTest >> generator [

	^ self subclassResponsibility
]

{ #category : 'running' }
AISampleGeneratorTest >> setUp [

	super setUp.
	generator := self generator
]

{ #category : 'tests' }
AISampleGeneratorTest >> testCorrectNumberOfSampleWithEvenNumber [

	| data data0 data1 |
	data := self generateSample: 10.
	self assert: data size equals: 10.

	data0 := data select: [ :each | (each at: 3) = 0 ].
	data1 := data select: [ :each | (each at: 3) = 1 ].

	self assert: data0 size equals: 5.
	self assert: data1 size equals: 5
]

{ #category : 'tests' }
AISampleGeneratorTest >> testCorrectNumberOfSampleWithOddNumber [

	| data data0 data1 |
	data := self generateSample: 9.
	self assert: data size equals: 9.

	data0 := data select: [ :each | (each at: 3) = 0 ].
	data1 := data select: [ :each | (each at: 3) = 1 ].

	self assert: data0 size equals: 5.
	self assert: data1 size equals: 4
]

{ #category : 'tests' }
AISampleGeneratorTest >> testInitialize [

	self assert: generator shuffling.
	self assert: generator random class equals: Random.
	self assert: generator utils class equals: AIGeneratorUtils
]

{ #category : 'tests' }
AISampleGeneratorTest >> testNoise [

	| dataClean dataNoised |
	generator
		shuffling: false;
		noise: nil.
	dataClean := self generateSample: 10.

	generator noise: 0.05.
	dataNoised := self generateSample: 10.

	self deny: dataNoised equals: dataClean
]

{ #category : 'tests' }
AISampleGeneratorTest >> testShuffle [

	| dataClean dataShuffled |
	generator shuffling: false.
	dataClean := self generateSample: 10.

	generator
		shuffling: true;
		random: (Random seed: 42).
	dataShuffled := self generateSample: 10.

	self assert: (dataClean shuffleBy: (Random seed: 42)) equals: dataShuffled
]
