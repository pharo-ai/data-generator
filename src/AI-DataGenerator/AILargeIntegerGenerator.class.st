Class {
	#name : #AILargeIntegerGenerator,
	#superclass : #AIValueGenerator,
	#category : #'AI-DataGenerator'
}

{ #category : #accessing }
AILargeIntegerGenerator >> next [

	^ random nextIntegerBetween: -100000 and: 100000.
]
