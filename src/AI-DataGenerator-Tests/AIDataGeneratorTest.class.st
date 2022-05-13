Class {
	#name : #AIDataGeneratorTest,
	#superclass : #TestCase,
	#instVars : [
		'generator'
	],
	#category : #'AI-DataGenerator-Tests'
}

{ #category : #initialization }
AIDataGeneratorTest >> setUp [ 

	super setUp.
	generator := AIDataGenerator new.
]

{ #category : #tests }
AIDataGeneratorTest >> testGenerateSmallDataset [

	| numberOfRows numberOfColumns data |
	
	numberOfRows := 3.
	numberOfColumns := 2.
	data := generator generateRows: numberOfRows columns: numberOfColumns.
	
	self assert: data size equals: numberOfRows.
	self assert: data first size equals: numberOfColumns.
	
	1 to: numberOfRows do: [ :i |
		1 to: numberOfColumns do: [ :j |
			self assert: ((data at: i) at: j) isNumber. ] ]
]
