Class {
	#name : 'AISmallIntegerGenerator',
	#superclass : 'AIValueGenerator',
	#category : 'AI-DataGenerator',
	#package : 'AI-DataGenerator'
}

{ #category : 'accessing' }
AISmallIntegerGenerator >> next [

	^ random nextIntegerBetween: -10 and: 10.
]
