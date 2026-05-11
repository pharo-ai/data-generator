Class {
	#name : 'AIBlobsGenerator',
	#superclass : 'AISampleGenerator',
	#instVars : [
		'centers',
		'centerBox',
		'numberOfFeatures',
		'clusterStandardDeviations'
	],
	#category : 'AI-DataGenerator',
	#package : 'AI-DataGenerator'
}

{ #category : 'accessing' }
AIBlobsGenerator >> centerBox [

	^ centerBox
]

{ #category : 'accessing' }
AIBlobsGenerator >> centerBox: anObject [

	centerBox := anObject
]

{ #category : 'accessing' }
AIBlobsGenerator >> centers [

	^ centers
]

{ #category : 'accessing' }
AIBlobsGenerator >> centers: anObject [

	^ centers := anObject
]

{ #category : 'accessing' }
AIBlobsGenerator >> clusterStd [

	^ clusterStandardDeviations
]

{ #category : 'accessing' }
AIBlobsGenerator >> clusterStd: anObject [

	clusterStandardDeviations := anObject
]

{ #category : 'generating' }
AIBlobsGenerator >> generateBlobs: numberOfSamples [

	| numberOfSamplesPerCluster blobs cumulativeSumOfSamples |
	numberOfSamplesPerCluster := self initializeClustersWith: numberOfSamples.

	cumulativeSumOfSamples := numberOfSamplesPerCluster asPMVector cumsum. "Other collections don't have a cumulative sum method, so we use a PMVector (which is similar to an Array)"
	blobs := DataFrame new: numberOfSamples @ (numberOfFeatures + 1).

	1 to: centers size do: [ :clusterIndex |
			| std startIndexOfCluster endIndexOfCluster gaussians |
			std := clusterStandardDeviations at: clusterIndex.
			startIndexOfCluster := clusterIndex > 1
				                       ifTrue: [ 1 + cumulativeSumOfSamples at: clusterIndex - 1 ]
				                       ifFalse: [ 1 ].
			endIndexOfCluster := cumulativeSumOfSamples at: clusterIndex.
			gaussians := (1 to: numberOfFeatures) collect: [ :featureIndex |
					             PMGaussianGenerator new
						             generator: utils pseudoRandomNumberGenerator;
						             mean: ((centers at: clusterIndex) at: featureIndex);
						             standardDeviation: std ].
			startIndexOfCluster to: endIndexOfCluster do: [ :i |
					| row |
					row := (gaussians collect: #next) asOrderedCollection.
					row add: clusterIndex. "clusterIndex acts as the label here"
					blobs rowAt: i put: row ] ].

	shuffling ifTrue: [ blobs shuffleBy: shuffleRandom ].

	^ blobs
]

{ #category : 'initialization' }
AIBlobsGenerator >> initialize [

	super initialize.
	numberOfFeatures := 2.
	clusterStandardDeviations := 1.0.
	centerBox := { -10. 10 }
]

{ #category : 'initialization' }
AIBlobsGenerator >> initializeClustersWith: numberOfSamples [

	| numberOfCenters numberOfSamplesPerCenter |
	centers ifNil: [ centers := 3 ].
	centers isNumber
		ifTrue: [
				numberOfCenters := centers.
				centers := (1 to: numberOfCenters) collect: [ :row |
					           (1 to: numberOfFeatures) collect: [ :col | shuffleRandom nextBetween: centerBox first and: centerBox second ] ] ]
		ifFalse: [
				numberOfCenters := centers size.
				numberOfFeatures := centers anyOne size ].
	clusterStandardDeviations isNumber ifTrue: [ clusterStandardDeviations := Array new: numberOfCenters withAll: clusterStandardDeviations ].
	numberOfSamplesPerCenter := Array new: numberOfCenters withAll: numberOfSamples // numberOfCenters.
	1 to: numberOfSamples % numberOfCenters do: [ :i | numberOfSamplesPerCenter at: i put: (numberOfSamplesPerCenter at: i) + 1 ].
	^ numberOfSamplesPerCenter
]

{ #category : 'rendering' }
AIBlobsGenerator >> showBlobs: numberOfSamples [

	| chart blobs |
	blobs := self generateBlobs: numberOfSamples.
	chart := RSCompositeChart new.
	1 to: centers size do: [ :i |
			| blob plot |
			blob := blobs select: [ :each | (each at: 3) = i ].
			plot := RSScatterPlot new x: (blob columnAt: 1) values y: (blob columnAt: 2) values.
			chart add: plot ].
	chart
		"minChartValueX: centerBox first - 5;
		maxChartValueX: centerBox second + 5;
		minChartValueY: centerBox first - 5;
		maxChartValueY: centerBox second + 5;"
		open.
	^ blobs
]
