Class {
	#name : #AILargeFloatGenerator,
	#superclass : #AIValueGenerator,
	#category : #'AI-DataGenerator'
}

{ #category : #accessing }
AILargeFloatGenerator >> next [

	^ random nextBetween: -100000 and: 100000
]
