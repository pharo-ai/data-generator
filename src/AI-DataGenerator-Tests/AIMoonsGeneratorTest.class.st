Class {
	#name : 'AIMoonsGeneratorTest',
	#superclass : 'AICircularSampleGeneratorTest',
	#category : 'AI-DataGenerator-Tests',
	#package : 'AI-DataGenerator-Tests'
}

{ #category : 'accessing' }
AIMoonsGeneratorTest >> defaultGenerator [

	^ AIMoonsGenerator new
]

{ #category : 'accessing' }
AIMoonsGeneratorTest >> expectedNoisedData: numberOfSamples [

	| rows |
	rows := {
		        { 1.0448204366263738. 0.010511476516221412. 0 }.
		        { -0.04506239843704657. 0.9161477640551079. 0 }.
		        { -1.024507763647755. 0.046002901673693426. 0 }.
		        { -0.06013567632688032. 0.4944904462403944. 1 }.
		        { 1.0221556840957131. -0.5409211326437198. 1 }.
		        { 2.000573505146629. 0.4594034330719663. 1 } }.
	^ DataFrame withRows: rows
]

{ #category : 'accessing' }
AIMoonsGeneratorTest >> generateSample: numberOfSamples [

	^ self generator generateMoons: numberOfSamples
]

{ #category : 'tests' }
AIMoonsGeneratorTest >> testInitialize [

	super testInitialize.
	self assert: generator start equals: 0.
	self assert: generator stop equals: Float pi
]
