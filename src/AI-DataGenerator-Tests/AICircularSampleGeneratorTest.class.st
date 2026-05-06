Class {
	#name : 'AICircularSampleGeneratorTest',
	#superclass : 'AISampleGeneratorTest',
	#category : 'AI-DataGenerator-Tests',
	#package : 'AI-DataGenerator-Tests'
}

{ #category : 'testing' }
AICircularSampleGeneratorTest class >> isAbstract [

	^ self = AICircularSampleGeneratorTest
]

{ #category : 'accessing' }
AICircularSampleGeneratorTest >> expectedNoisedData: numberOfSamples [

	^ self subclassResponsibility
]

{ #category : 'tests' }
AICircularSampleGeneratorTest >> testCorrectNumberOfSampleWithEvenNumber [

	| data data0 data1 |
	data := self generateSample: 10.
	self assert: data size equals: 10.

	data0 := data select: [ :each | (each at: 3) = 0 ].
	data1 := data select: [ :each | (each at: 3) = 1 ].

	self assert: data0 size equals: 5.
	self assert: data1 size equals: 5
]

{ #category : 'tests' }
AICircularSampleGeneratorTest >> testCorrectNumberOfSampleWithOddNumber [

	| data data0 data1 |
	data := self generateSample: 9.
	self assert: data size equals: 9.

	data0 := data select: [ :each | (each at: 3) = 0 ].
	data1 := data select: [ :each | (each at: 3) = 1 ].

	self assert: data0 size equals: 5.
	self assert: data1 size equals: 4
]

{ #category : 'tests' }
AICircularSampleGeneratorTest >> testNoise [

	| utils expected actual |
	utils := AIGeneratorUtils new.
	utils pseudoRandomNumberGenerator: (utils defaultPseudoRandomNumberGeneratorWithSeed: 42).
	generator
		shuffling: false;
		noise: 0.05;
		utils: utils.

	expected := self expectedNoisedData: 6.
	actual := self generateSample: 6.

	self assert: actual equals: expected
]

{ #category : 'tests' }
AICircularSampleGeneratorTest >> testShuffle [

	| dataClean dataShuffled |
	generator shuffling: false.
	dataClean := self generateSample: 10.

	generator
		shuffling: true;
		shuffleRandom: (Random seed: 42).
	dataShuffled := self generateSample: 10.

	self assert: (dataClean copy shuffleBy: (Random seed: 42)) equals: dataShuffled.
	self deny: (dataClean copy shuffleBy: (Random seed: 41)) equals: dataShuffled
]
