Class {
	#name : #BaselineOfAIDataGenerator,
	#superclass : #BaselineOf,
	#category : #BaselineOfAIDataGenerator
}

{ #category : #baselines }
BaselineOfAIDataGenerator >> baseline: spec [

	<baseline>
	spec for: #common do: [

		"Packages"
		spec package: 'AI-DataGenerator'.
		spec package: 'AI-DataGenerator-Tests' with: [ spec requires: #( 'AI-DataGenerator' ) ] ].
]
