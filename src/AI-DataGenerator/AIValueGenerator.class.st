Class {
	#name : #AIValueGenerator,
	#superclass : #Object,
	#instVars : [
		'random'
	],
	#category : #'AI-DataGenerator'
}

{ #category : #initialization }
AIValueGenerator >> initialize [ 
	super initialize.
	random := Random new.
]

{ #category : #accessing }
AIValueGenerator >> next [

	self subclassResponsibility
]
