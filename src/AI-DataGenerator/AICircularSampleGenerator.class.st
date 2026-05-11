Class {
	#name : 'AICircularSampleGenerator',
	#superclass : 'AISampleGenerator',
	#instVars : [
		'noise',
		'start',
		'stop'
	],
	#category : 'AI-DataGenerator',
	#package : 'AI-DataGenerator'
}

{ #category : 'testing' }
AICircularSampleGenerator class >> isAbstract [

	^ self = AICircularSampleGenerator
]

{ #category : 'accessing' }
AICircularSampleGenerator >> noise [

	^ noise
]

{ #category : 'accessing' }
AICircularSampleGenerator >> noise: aFloat [

	noise := aFloat
]

{ #category : 'accessing' }
AICircularSampleGenerator >> start [

	^ start
]

{ #category : 'accessing' }
AICircularSampleGenerator >> start: aFloat [

	start := aFloat
]

{ #category : 'accessing' }
AICircularSampleGenerator >> stop [

	^ stop
]

{ #category : 'accessing' }
AICircularSampleGenerator >> stop: aFloat [

	stop := aFloat
]
