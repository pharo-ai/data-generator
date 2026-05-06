Class {
	#name : 'AIMoonsGeneratorTest',
	#superclass : 'AISampleGeneratorTest',
	#category : 'AI-DataGenerator-Tests',
	#package : 'AI-DataGenerator-Tests'
}

{ #category : 'accessing' }
AIMoonsGeneratorTest >> generateSample: numberOfSamples [

	^ self generator generateMoons: numberOfSamples
]

{ #category : 'accessing' }
AIMoonsGeneratorTest >> generator [

	^ generator ifNil: [ generator := AIMoonsGenerator new ]
]
