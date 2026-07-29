Class {
	#name : 'BaselineOfAIDataGenerator',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfAIDataGenerator',
	#package : 'BaselineOfAIDataGenerator'
}

{ #category : 'baselines' }
BaselineOfAIDataGenerator >> baseline: spec [

	<baseline>
	spec for: #common do: [ "Packages"
			spec package: 'AI-DataGenerator'.
			spec package: 'AI-DataGenerator-Tests' with: [ spec requires: #( 'AI-DataGenerator' ) ].

			spec baseline: 'PolyMath' with: [ spec repository: 'github://PolyMathOrg/PolyMath:master/src' ].
			spec baseline: 'DataFrame' with: [ spec repository: 'github://PolyMathOrg/DataFrame/src' ] ]
]
