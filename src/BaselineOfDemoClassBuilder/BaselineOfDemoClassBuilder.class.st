Class {
	#name : #BaselineOfDemoClassBuilder,
	#superclass : #BaselineOf,
	#category : #'BaselineOfDemoClassBuilder-Baseline'
}

{ #category : #baselines }
BaselineOfDemoClassBuilder >> baseline: spec [
	<baseline>
	spec for: #common do: [
		spec package: 'Demo'.
		spec package: 'Demo-Test'.
		 ]
]
