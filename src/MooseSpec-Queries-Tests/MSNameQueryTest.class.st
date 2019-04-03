Class {
	#name : #MSNameQueryTest,
	#superclass : #MSAbstractQueryTest,
	#category : #'MooseSpec-Queries-Tests-Terminal'
}

{ #category : #helpers }
MSNameQueryTest >> actualClass [
	^ MSNameQuery
]

{ #category : #tests }
MSNameQueryTest >> testDisplayOn [
	query := MSNameQuery fromString: 'LANP'. 
	
	self assert: (String streamContents: [ :s | query displayOn: s]) equals: 'mooseGroup select: [ :each | each includesSubstring: LANP ]'
]

{ #category : #tests }
MSNameQueryTest >> testRunOn [
	| classes |
	classes := model allModelClasses select: #isInstanceSide.
	query := MSNameQuery fromString: 'LANP'.

	self assert: (query runOn: classes) size equals: 3.
	self assertCollection: ((query runOn: classes) collect: #name) hasSameElements: #('LANPool' 'LANPacket' 'LANPrintServer')
]
