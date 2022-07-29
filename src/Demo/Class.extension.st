Extension { #name : #Class }

{ #category : #'*Demo' }
Class >> inspectorTreeBuilder [
	<inspectorPresentationOrder: 1 title: 'Subclass Hierarchy'>

	^ TreeClassBuilder new
		classes: self withAllSubclasses;
		asPresenter
]
