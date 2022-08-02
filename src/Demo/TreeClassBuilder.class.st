Class {
	#name : #TreeClassBuilder,
	#superclass : #RSAbstractContainerBuilder,
	#instVars : [
		'classes'
	],
	#category : #Demo
}

{ #category : #accessing }
TreeClassBuilder >> classes [
	^ classes
]

{ #category : #accessing }
TreeClassBuilder >> classes: aCollectionOfClasses [
	classes := aCollectionOfClasses
]

{ #category : #hooks }
TreeClassBuilder >> createBoxFor: aClass [
	^ RSBox new
		model: aClass;
		popup;
		draggable;
		yourself
]

{ #category : #hooks }
TreeClassBuilder >> createBoxes [
	^ self classes collect: [ :class | self createBoxFor: class ]
]

{ #category : #hooks }
TreeClassBuilder >> createLinesFor: boxes [
	| lineBuilder |
	lineBuilder := RSLineBuilder orthoVertical.
	lineBuilder
		withVerticalAttachPoint;
		color: Color black;
		shapes: boxes.
	^ lineBuilder connectFrom: #superclass.
]

{ #category : #'accessing - defaults' }
TreeClassBuilder >> defaultContainer [
	^ RSCanvas new
		@ RSCanvasController;
		yourself
]

{ #category : #initialization }
TreeClassBuilder >> initialize [
	super initialize.
	classes := #().
]

{ #category : #utilities }
TreeClassBuilder >> layout: aGroupOfBoxes [
	RSTreeLayout on: aGroupOfBoxes
]

{ #category : #utilities }
TreeClassBuilder >> normalize: aGroupOfBoxes [
	RSNormalizer size
		from: 10;
		to: 100;
		shapes: aGroupOfBoxes;
		normalize: #linesOfCode.

	RSNormalizer color
		from: Color blue;
		to: Color red;
		shapes: aGroupOfBoxes;
		normalize: #linesOfCode.
]

{ #category : #hooks }
TreeClassBuilder >> renderIn: canvas [
	| boxes lines |
	boxes := self createBoxes.
	self normalize: boxes.
	lines := self createLinesFor: boxes.
	self layout: boxes.
	canvas
		addAll: lines;
		addAll: boxes
]
