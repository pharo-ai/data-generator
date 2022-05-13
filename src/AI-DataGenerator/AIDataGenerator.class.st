Class {
	#name : #AIDataGenerator,
	#superclass : #Object,
	#category : #'AI-DataGenerator'
}

{ #category : #'as yet unclassified' }
AIDataGenerator >> generateRows: aNumberOfRows columns: aNumberOfColumns [

	| data row columnGenerators |
	data := OrderedCollection new.
	
	columnGenerators := (1 to: aNumberOfColumns) collect: [ :j |
		self generators atRandom ].
	
	(1 to: aNumberOfRows)
		do: [ :i | 
			row := (1 to: aNumberOfColumns) collect: [ :j |
				(columnGenerators at: j) next ].
			data add: row. ]
		displayingProgress: [ :i | 'Generating row ', i asString ].
	
	^ data
]

{ #category : #'as yet unclassified' }
AIDataGenerator >> generators [

	^ { 
		AISmallIntegerGenerator new .
		AILargeIntegerGenerator new .
		AISmallFloatGenerator new .
		AILargeFloatGenerator new
	}
]
