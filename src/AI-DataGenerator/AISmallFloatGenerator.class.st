Class {
	#name : #AISmallFloatGenerator,
	#superclass : #AIValueGenerator,
	#category : #'AI-DataGenerator'
}

{ #category : #accessing }
AISmallFloatGenerator >> next [

	^ random nextBetween: 0 and: 1
]
