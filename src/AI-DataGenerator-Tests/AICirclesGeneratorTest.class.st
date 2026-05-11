Class {
	#name : 'AICirclesGeneratorTest',
	#superclass : 'AICircularSampleGeneratorTest',
	#category : 'AI-DataGenerator-Tests',
	#package : 'AI-DataGenerator-Tests'
}

{ #category : 'accessing' }
AICirclesGeneratorTest >> defaultGenerator [

	^ AICirclesGenerator new
]

{ #category : 'accessing' }
AICirclesGeneratorTest >> expectedNoisedData: numberOfSamples [

	| rows |
	rows := {
		        { 1.0448204366263738. 0.010511476516221412. 0 }.
		        { -0.5450623984370465. 0.7821731678395466. 0 }.
		        { -0.5245077636477555. -0.8200225021107451. 0 }.
		        { 0.7398643236731197. -0.005509553759605577. 1 }.
		        { -0.3778443159042865. 0.6518991903838313. 1 }.
		        { -0.3994264948533713. -0.7334168899555843. 1 } }.
	^ DataFrame withRows: rows
]

{ #category : 'accessing' }
AICirclesGeneratorTest >> generateSample: numberOfSamples [

	^ self generator generateCircles: numberOfSamples
]

{ #category : 'tests' }
AICirclesGeneratorTest >> testInitialize [

	super testInitialize.
	self assert: generator start equals: 0.
	self assert: generator stop equals: 2 * Float pi.
	self assert: generator factor equals: 0.8
]
