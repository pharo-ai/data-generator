Class {
	#name : 'AISampleGeneratorDemonstration',
	#superclass : 'Object',
	#category : 'AI-DataGenerator',
	#package : 'AI-DataGenerator'
}

{ #category : 'rendering' }
AISampleGeneratorDemonstration >> linkageMethodsComparison [

	<script: 'self new linkageMethodsComparison open'>
	| numberOfSamples random circles moons blobs canvas datasets numbersOfClusters linkages layout |
	numberOfSamples := 1500.
	random := Random seed: 142.
	circles := AICirclesGenerator new
		           factor: 0.5;
		           noise: 0.05;
		           shuffleRandom: random;
		           generateCircles: numberOfSamples.
	moons := AIMoonsGenerator new
		         noise: 0.05;
		         shuffleRandom: random;
		         generateMoons: numberOfSamples.
	blobs := AIBlobsGenerator new
		         centers: {
				         { -6. -1 }.
				         { -1. 4 }.
				         { 5. 4 } };
		         shuffleRandom: random;
		         generateBlobs: numberOfSamples.

	datasets := {
		            circles.
		            moons.
		            blobs } collect: [ :sample | sample removeColumnAt: 3 ].
	numbersOfClusters := { 2. 2. 3 }.
	linkages := { #singleLinkage. #averageLinkage. #completeLinkage. #wardsMethod }.
	canvas := RSCanvas new.

	datasets withIndexDo: [ :dataset :index |
			linkages do: [ :linkage |
					| numberOfCluster clusty clusters compChart |
					numberOfCluster := numbersOfClusters at: index.
					clusty := AIClusterEngine with: dataset.
					clusty hierarchicalClusteringUsing: linkage.
					clusters := clusty dendrogram breakInto: numberOfCluster.
					compChart := RSCompositeChart new.
					clusters do: [ :cluster | compChart add: (RSScatterPlot new x: (cluster collect: #first) y: (cluster collect: #second)) ].
					compChart colors: NSScale category10.
					compChart removeAllTicks.
					index = 1 ifTrue: [ compChart title: linkage ].
					canvas add: compChart asShape ] ].

	layout := RSGridLayout on: canvas shapes.
	canvas @ RSCanvasController.
	^ canvas
]
