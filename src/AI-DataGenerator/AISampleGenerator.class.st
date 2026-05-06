Class {
	#name : 'AISampleGenerator',
	#superclass : 'Object',
	#instVars : [
		'shuffling',
		'utils',
		'shuffleRandom'
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
	shuffleRandom := Random new.
	utils := AIGeneratorUtils new
]

{ #category : 'accessing' }
AISampleGenerator >> shuffleRandom [

	^ shuffleRandom
]

{ #category : 'accessing' }
AISampleGenerator >> shuffleRandom: aRandom [

	shuffleRandom := aRandom
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
