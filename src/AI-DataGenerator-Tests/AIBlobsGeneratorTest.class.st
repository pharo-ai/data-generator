Class {
	#name : 'AIBlobsGeneratorTest',
	#superclass : 'AISampleGeneratorTest',
	#category : 'AI-DataGenerator-Tests',
	#package : 'AI-DataGenerator-Tests'
}

{ #category : 'accessing' }
AIBlobsGeneratorTest >> defaultGenerator [

	^ AIBlobsGenerator new
]

{ #category : 'accessing' }
AIBlobsGeneratorTest >> generateSample: numberOfSamples [

	^ self generator generateBlobs: numberOfSamples
]

{ #category : 'tests' }
AIBlobsGeneratorTest >> testCorrectNumberOfSampleWithNumberMultipleOf3 [
	"By default there are 3 blobs"

	| data data1 data2 data3 |
	data := self generateSample: 12.
	self assert: data size equals: 12.

	data1 := data select: [ :each | (each at: 3) = 1 ].
	data2 := data select: [ :each | (each at: 3) = 2 ].
	data3 := data select: [ :each | (each at: 3) = 3 ].

	self assert: data1 size equals: 4.
	self assert: data2 size equals: 4.
	self assert: data3 size equals: 4
]

{ #category : 'tests' }
AIBlobsGeneratorTest >> testCorrectNumberOfSampleWithNumberNonMultipleOf3 [
	"By default there are 3 blobs"

	| data data1 data2 data3 |
	data := self generateSample: 11.
	self assert: data size equals: 11.

	data1 := data select: [ :each | (each at: 3) = 1 ].
	data2 := data select: [ :each | (each at: 3) = 2 ].
	data3 := data select: [ :each | (each at: 3) = 3 ].

	self assert: data1 size equals: 4.
	self assert: data2 size equals: 4.
	self assert: data3 size equals: 3
]

{ #category : 'tests' }
AIBlobsGeneratorTest >> testShuffle [

	| utils dataClean dataShuffled |
	utils := AIGeneratorUtils new.
	utils pseudoRandomNumberGenerator: (utils defaultPseudoRandomNumberGeneratorWithSeed: 42).

	generator
		utils: utils;
		shuffleRandom: (Random seed: 42);
		shuffling: false.
	dataClean := self generateSample: 10.

	"We need to reset the random generators"
	utils pseudoRandomNumberGenerator: (utils defaultPseudoRandomNumberGeneratorWithSeed: 42).
	generator
		shuffleRandom: (Random seed: 42);
		shuffling: true.
	dataShuffled := self generateSample: 10.

	self assert: (dataClean copy shuffleBy: (Random seed: 42)) equals: dataShuffled.
	self deny: (dataClean copy shuffleBy: (Random seed: 41)) equals: dataShuffled
]
