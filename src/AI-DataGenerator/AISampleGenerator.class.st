Class {
	#name : 'AISampleGenerator',
	#superclass : 'Object',
	#instVars : [
		'shuffling',
		'random',
		'noise',
		'start',
		'stop',
		'utils'
	],
	#category : 'AI-DataGenerator',
	#package : 'AI-DataGenerator'
}

{ #category : 'initialization' }
AISampleGenerator >> initialize [ 

	shuffling := true.
	random := Random new.
	utils := AIGeneratorUtils new
]

{ #category : 'accessing' }
AISampleGenerator >> noise [

	^ noise
]

{ #category : 'accessing' }
AISampleGenerator >> noise: anObject [

	noise := anObject
]

{ #category : 'accessing' }
AISampleGenerator >> random [

	^ random
]

{ #category : 'accessing' }
AISampleGenerator >> random: anObject [

	random := anObject
]

{ #category : 'accessing' }
AISampleGenerator >> shuffling [

	^ shuffling
]

{ #category : 'accessing' }
AISampleGenerator >> shuffling: anObject [

	shuffling := anObject
]

{ #category : 'accessing' }
AISampleGenerator >> startCircle [

	^ start
]

{ #category : 'accessing' }
AISampleGenerator >> startCircle: anObject [

	start := anObject
]

{ #category : 'accessing' }
AISampleGenerator >> stopCircle [

	^ stop
]

{ #category : 'accessing' }
AISampleGenerator >> stopCircle: anObject [

	stop := anObject
]

{ #category : 'accessing' }
AISampleGenerator >> utils [

	^ utils
]
