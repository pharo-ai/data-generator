Class {
	#name : 'AISampleGenerator',
	#superclass : 'Object',
	#instVars : [
		'shuffling',
		'random',
		'utils'
	],
	#category : 'AI-DataGenerator',
	#package : 'AI-DataGenerator'
}

{ #category : 'testing' }
AISampleGenerator class >> isAbstract [

	^ self = AISampleGenerator
]

{ #category : 'initialization' }
AISampleGenerator >> initialize [ 

	shuffling := true.
	random := Random new.
	utils := AIGeneratorUtils new
]

{ #category : 'accessing' }
AISampleGenerator >> random [

	^ random
]

{ #category : 'accessing' }
AISampleGenerator >> random: aRandom [

	random := aRandom
]

{ #category : 'accessing' }
AISampleGenerator >> shuffling [

	^ shuffling
]

{ #category : 'accessing' }
AISampleGenerator >> shuffling: aBoolean [

	shuffling := aBoolean
]

{ #category : 'accessing' }
AISampleGenerator >> utils [

	^ utils
]

{ #category : 'accessing' }
AISampleGenerator >> utils: anObject [

	utils := anObject
]
